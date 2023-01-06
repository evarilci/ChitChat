//
//  ViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 2.01.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: Properties
    let loginView = LoginView()
    let signUpView = SignUpView()
    let viewModel : authViewModel
    
    // MARK: INIT
    init(viewModel: authViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        view = loginView
        
        // BUTTON ACTIONS
        signUpView.changeViewAction = { // change view to login
            self.view = self.loginView
        }
        signUpView.signUpAction = { // signUp action trigger
            self.viewModel.createUser(name: self.signUpView.name, email: self.signUpView.email, password: self.signUpView.password, phone: self.signUpView.phone, photo: self.signUpView.photo) { result in
                switch result {
                case .success(_):
                    self.authSucceded()
                case.failure(let error):
                    self.errorOcurred(error)
                }
            }
        }
        
        loginView.signInAction = { // login action trigger
            
            self.viewModel.signIn(email: self.loginView.email, password: self.loginView.password) { result in
                switch result {
                case .success(_):
                    self.authSucceded()
                case.failure(let error):
                    self.errorOcurred(error)
                }
            }
        }
        
        loginView.changeViewAction = { // change view to signUp
            self.view = self.signUpView
        }
    }
}

// MARK: DELEGATE EXTENSION
extension LoginViewController: AuthViewModelDelegate {
    func errorOcurred(_ error: Error) {
        print("SOME ERROR OCCURED AND CATCHED IN VC \(error)")
    }
    
    func authSucceded() {
        print("READY TO NAVIGATE")
    }
    
    
}

