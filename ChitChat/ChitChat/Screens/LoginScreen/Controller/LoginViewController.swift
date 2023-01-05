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
    
    init(viewModel: authViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
      
        
        
        signUpView.action1 = {
            self.view = self.loginView
        }
        signUpView.action2 = {
            self.viewModel.createNewUser(name: self.signUpView.name, email: self.signUpView.email, password: self.signUpView.password, phone: self.signUpView.phone, photo: self.signUpView.photo)
        }
        loginView.action = {
            self.view = self.signUpView
         }
    }
}

