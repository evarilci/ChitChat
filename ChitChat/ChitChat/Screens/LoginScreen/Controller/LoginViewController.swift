//
//  ViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 2.01.2023.
//

import UIKit

final class LoginViewController: UIViewController, authViewModelDelegate {
    func createNewUser(name: String, email: String, password: String, phone: String, photo: String) {
        <#code#>
    }
    
    func signInUser(email: String, password: String) {
        <#code#>
    }
    
    // MARK: Properties
    let loginView = LoginView()
    let signUpView = SignUpView()
    let viewModel : authViewModel
    
    init(viewModel: authViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var login = true
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
     view = loginView
      
        
        
        signUpView.changeViewAction = {
            self.view = self.loginView
        }
        signUpView.signUpAction = {
            self.viewModel.createNewUser(name: self.signUpView.name, email: self.signUpView.email, password: self.signUpView.password, phone: self.signUpView.phone, photo: self.signUpView.photo)
        }
        loginView.signInAction = {
           // self.viewModel.signInUser(email: self.loginView.email, password: self.loginView.password)
            
            
            self.viewModel.signIn(email: self.loginView.email, password: self.loginView.password) { result in
                // TODO: Navigate to mainscreen
                switch result {
                case.success(let user):
                    print("ready to navigate!!!!!!!!!!!!! with \(user)")
                case.failure(_):
                    print("can not navigate!!!!!!!!!!")
                }
            }
        }
        
        loginView.changeViewAction = {
            self.view = self.signUpView
         }
    }
}

