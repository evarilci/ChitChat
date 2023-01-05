//
//  AuthViewModel.swift
//  ChitChat
//
//  Created by Eymen Varilci on 5.01.2023.
//

import Foundation

protocol authViewModelDelegate: AnyObject {
    func createNewUser(name: String, email: String, password: String, phone: String, photo: String)
}

class authViewModel: FirebaseAccesible {
    weak var delegate: authViewModelDelegate?
    
    private let firebaseAuth: FireBaseAccessibleProtocol
    init(firebaseAuth: FireBaseAccessibleProtocol) {
        self.firebaseAuth = firebaseAuth
    }
    
    func createNewUser(name: String, email: String, password: String, phone: String, photo: String) {
        firebaseAuth.createUser(name: name, email: email, password: password, phone: phone, photo: photo) { result in
            switch result {
            case.success(let user):
                print("succes\(user)")
            case.failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    }
    

