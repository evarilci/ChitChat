//
//  ViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 2.01.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    // MARK: Properties
    let emailTextField = AuthTextField(header:"email" , placeholder: "example@mail.com", backgroundColor: UIColor.systemGray5, error: "error")
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientWith([UIColor.systemGray6.cgColor, UIColor.systemIndigo.cgColor], in: [0,1])
        viewDidLayoutSubviews()
        layoutSet()
    }
    
    func layoutSet() {
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
}

