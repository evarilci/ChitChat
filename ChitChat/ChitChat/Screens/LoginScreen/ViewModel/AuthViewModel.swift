//
//  AuthViewModel.swift
//  ChitChat
//
//  Created by Eymen Varilci on 5.01.2023.
//

import Foundation

enum AuthViewModelChange {
    case didErrorOccurred(_ error: Error)
    case didSignUpSuccessful
}

protocol authViewModelDelegate: AnyObject {
    func createNewUser(name: String, email: String, password: String, phone: String, photo: String)
    func signInUser(email: String, password: String)
    func navigateToTabbar()
}

class authViewModel: FireStoreAccesible {
    weak var delegate: authViewModelDelegate?
    var changeHandler: ((AuthViewModelChange) -> Void)?
    
    private let firebaseAuth: FireStoreAccessibleProtocol
    init(firebaseAuth: FireStoreAccessibleProtocol) {
        self.firebaseAuth = firebaseAuth
    }
    
    func createNewUser(name: String, email: String, password: String, phone: String, photo: String) {
        firebaseAuth.createUser(name: name, email: email, password: password, phone: phone, photo: photo) { result in
            switch result {
            case.success(_):
                self.changeHandler?(.didSignUpSuccessful)
            case.failure(let error):
                self.changeHandler?(.didErrorOccurred(error))
            }
        }
    }
    
    func signInUser(email: String, password: String) {
        firebaseAuth.signIn(email: email, password: password) { result in
            switch result {
            case .success(let user):
                print("USER IS: \(user)")
                
            case.failure(let error):
                print("ERROR OCCURED \(error)")
                
                
            }
        }
        
    }
    
    }
    

