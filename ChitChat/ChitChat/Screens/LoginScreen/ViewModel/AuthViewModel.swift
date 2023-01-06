//
//  AuthViewModel.swift
//  ChitChat
//
//  Created by Eymen Varilci on 5.01.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

protocol AuthViewModelDelegate: AnyObject {
    func errorOcurred(_ error: Error)
    func authSucceded()
}

protocol AuthViewModelProtocol {
    var delegate: AuthViewModelDelegate? { get set }
    
    func createUser(name: String, email: String, password: String, phone: String, photo: String, completion: @escaping(Result<User,Error>) -> Void)
    func signIn(email: String, password: String, completion: @escaping(Result<User,Error>) -> Void)
}


final class authViewModel: AuthViewModelProtocol {
    
    // MARK: delegate AND PROPERTIES
    weak var delegate: AuthViewModelDelegate?
    
    var db: Firestore {
        Firestore.firestore()
    }
    
    var auth: Auth {
        Auth.auth()
    }
    
    // MARK: Auth methods
    //SIGN UP
    func createUser(name: String, email: String, password: String, phone: String, photo: String, completion: @escaping (Result<User, Error>) -> Void) {
        let user = User(name: name, email: email, password: password, phone: phone, photo: photo)
        DispatchQueue.main.async {
            self.auth.createUser(withEmail: email, password: password) {[weak self] result, error in
                if let e = error {
                    print("error occured while creating user: \(e)")
                    self?.delegate?.errorOcurred(e)
                } else {
                    guard let userID = self?.auth.currentUser?.uid else {return}
                    self?.db.collection("User_\(userID)").addDocument(data: ["name": user.name,
                                                                             "email": user.email,
                                                                             "phone":user.phone,
                                                                             "photo":user.photo]) { error in
                        guard error == nil else {
                            print("error occured while adding user data to firestore: \(String(describing: error))")
                            self?.delegate?.errorOcurred(error!)
                            return
                        }
                        self?.delegate?.authSucceded()
                    }
                }
            }
        }
    }
    // SIGN IN
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        self.auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            if error != nil {
                self?.delegate?.errorOcurred(error!)
            } else {
                print("signed in bro")
                self?.delegate?.authSucceded()
                
            }
        }
    }
}


