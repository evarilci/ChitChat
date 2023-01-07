//
//  FirestoreKit.swift
//  ChitChat
//
//  Created by Eymen Varilci on 6.01.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth


// TODO: Add database methods
protocol FireStoreAccessibleProtocol {
    func createUser(name: String, email: String, password: String, phone: String, photo: String, completion: @escaping(Result<User,Error>) -> Void)
    
    func signIn(email: String, password: String, completion: @escaping(Result<User,Error>) -> Void)
}

class FireStoreAccesible: FireStoreAccessibleProtocol {
    
    var db: Firestore {
        Firestore.firestore()
    }
    
    var auth: Auth {
        Auth.auth()
    }
    func createUser(name: String, email: String, password: String, phone: String, photo: String, completion: @escaping (Result<User,Error>) -> Void) {
        let user = User(name: name, email: email, password: password, phone: phone, photo: photo)
        DispatchQueue.main.async {
            self.auth.createUser(withEmail: email, password: password) { result, error in
                if let e = error {
                    print("error occured while creating user: \(e)")
                } else {
                    
                    guard let userID = self.auth.currentUser?.uid else {return}
                    self.db.collection("User_\(userID)").addDocument(data: ["name": user.name,
                                                             "email": user.email,
                                                                  "phone":user.phone,
                                                                  "photo":user.photo]) { error in
                        guard error == nil else {
                            print("error occured while adding user data to firestore: \(String(describing: error))")
                            return
                        }
                    }
                }
            }
        }
    }
    func signIn(email: String, password: String, completion: @escaping(Result<User,Error>) -> Void) {
        self.auth.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print("sign in error occured: \(error!)")
            } else {
                print("signed in bro")
            }
        }
    }
}

