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
        //self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var login = true
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.navigationController?.navigationBar.isHidden = true
       
     view = loginView
      
        
        
        signUpView.changeViewAction = {
            self.view = self.loginView
        }
        signUpView.signUpAction = {
            
            self.viewModel.createUser(name: self.signUpView.name, email: self.signUpView.email, password: self.signUpView.password, phone: self.signUpView.phone, photo: self.signUpView.photo) { result in
                switch result {
                case .success(_):
                    self.authSucceded()
                case.failure(let error):
                    self.errorOcurred(error)
                }
            }
            
        }
        loginView.signInAction = {
          
            self.viewModel.signIn(email: self.loginView.email, password: self.loginView.password) { result in
                switch result {
                case .success(_):
                    self.authSucceded()
                case.failure(let error):
                    self.errorOcurred(error)
                }
            }
        }
        
        loginView.changeViewAction = {
            self.view = self.signUpView
         }
    }
}

extension LoginViewController: AuthViewModelDelegate {
    func errorOcurred(_ error: Error) {
        print("SOME ERROR OCCURED AND CATCHED IN VC \(error)")
    }
    
    func authSucceded() {
        print("READY TO NAVIGATE")
    }
    
    
}

