//
//  LoginView.swift
//  ChitChat
//
//  Created by Eymen Varilci on 3.01.2023.
//

import UIKit

final class LoginView: UIView {

    let emailTextField = AuthTextField(header:"email" , placeholder: "example@mail.com", backgroundColor: UIColor.systemGray5, error: "error")
    
    let passwordTextField = AuthTextField(header:"password" , placeholder: "choose it wisely", backgroundColor: UIColor.systemGray5, error: "error")
  
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "message.fill")!
        imageView.tintColor = UIColor.systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemGray6
        layoutSet()
        emailTextField.textContentType = .emailAddress
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        passwordTextField.textContentType = .password
        emailTextField.errorLabel.text = ""
        passwordTextField.errorLabel.text = ""
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutSet() {
        addSubview(imageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
                NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            
            emailTextField.topAnchor.constraint(equalTo:imageView.bottomAnchor, constant: 48),
            emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 56),
            passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    
}
