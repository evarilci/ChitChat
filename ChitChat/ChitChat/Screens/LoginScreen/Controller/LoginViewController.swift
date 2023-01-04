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
    
    var login = true
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
     view = loginView
      
        signUpView.action1 = {
            self.view = self.loginView
        }
        loginView.action = {
            self.view = self.signUpView
         }
    }
}

