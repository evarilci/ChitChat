//
//  FirebaseAccesible.swift
//  ChitChat
//
//  Created by Eymen Varilci on 5.01.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

protocol FireBaseAccessibleProtocol {
    func createUser(name: String, email: String, password: String, phone: String, photo: String, completion: @escaping(Result<User,Error>) -> Void)
}

extension FireBaseAccessibleProtocol {
    var db: Firestore {
        Firestore.firestore()
    }
    var storage: Storage {
        Storage.storage()
    }
    
    var StorageMetadata: StorageMetadata {
        FirebaseStorage.StorageMetadata()
    }
    var auth: Auth {
        Auth.auth()
    }
}

class FirebaseAccesible: FireBaseAccessibleProtocol {
    func createUser(name: String, email: String, password: String, phone: String, photo: String, completion: @escaping (Result<User,Error>) -> Void) {
        let user = User(name: name, email: email, password: password, phone: phone, photo: photo)
        DispatchQueue.main.async {
            self.auth.createUser(withEmail: email, password: password) { result, error in
                if let e = error {
                    print("error occured while creating user: \(e)")
                } else {
                    self.db.collection("User").addDocument(data: ["name": user.name,
                                                             "email": user.email,
                                                                  "phone":user.phone,
                                                                  "photo":user.photo]) { error in
                        guard error != nil else {
                            print("error occured while adding user data to firestore: \(String(describing: error))")
                            return
                            
                        }
                    }
                }
            }
        }
    }
}

