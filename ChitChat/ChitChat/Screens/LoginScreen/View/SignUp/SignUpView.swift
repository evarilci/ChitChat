//
//  SignUpView.swift
//  ChitChat
//
//  Created by Eymen Varilci on 3.01.2023.
//

import UIKit

final class SignUpView: UIView {
    
    var changeViewAction : (() -> Void)? = nil
    var signUpAction : (() -> Void)? = nil
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "message.fill")!
        imageView.tintColor = UIColor.systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    var name: String {
        get {
           nameTextField.text ?? "name have not come"
        }
    }
    
    var email: String {
        get {
            emailTextField.text ?? "email have not come"
        }
    }
    
    var password: String {
        get {
            if passwordTextField.text == passwordAgainTextField.text {
               return passwordTextField.text ?? "password error"
            } else {
                passwordAgainTextField.errorLabel.text = "Passwords does not match"
                return "password error"
            }
        }
    }
    
    
    var phone: String {
        get {
            phoneTextField.text ?? "phone have not come"
        }
    }
    
    
    var photo: String {
        get {
            "photo url comes here"
        }
    }
    
    
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.secondaryLabel, for: .normal)
        button.setTitle("Have an account? Sign in!", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setBackgroundColor(UIColor.systemGreen, for: .normal)
        button.setBackgroundColor(UIColor.systemGreen.withAlphaComponent(0.7), for: .highlighted)
        button.setTitle("Sign Up", for: .normal)
        button.setTitle("Sign Up", for: .highlighted)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameTextField = AuthTextField(header:"Full name" , placeholder: "John Appleseed", backgroundColor: UIColor.systemGray5, error: "error")
    
    
    private let emailTextField = AuthTextField(header:"email" , placeholder: "example@mail.com", backgroundColor: UIColor.systemGray5, error: "error")
    
    
    private let phoneTextField = AuthTextField(header:"phone" , placeholder: "5553178326", backgroundColor: UIColor.systemGray5, error: "error")
    
    private let passwordTextField = AuthTextField(header:"password" , placeholder: "******", backgroundColor: UIColor.systemGray5, error: "error")
    
    private let passwordAgainTextField = AuthTextField(header:"password" , placeholder: "retype password", backgroundColor: UIColor.systemGray5, error: "error")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.systemGray6
        
        layoutSet()
        emailTextField.textContentType = .emailAddress
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        passwordAgainTextField.textContentType = .password
        passwordAgainTextField.isSecureTextEntry = true
        emailTextField.errorLabel.text = ""
        passwordTextField.errorLabel.text = ""
        nameTextField.errorLabel.text = ""
        phoneTextField.errorLabel.text = ""
        passwordAgainTextField.errorLabel.text = ""
        
        dontHaveAccountButton.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func changeView() {
        changeViewAction?()
    }
    
    @objc func signUpTapped() {
        signUpAction?()
    }
    
    
    func layoutSet() {
        
        let stackView = UIStackView(arrangedSubviews: [nameTextField,
                                                       emailTextField,
                                                       phoneTextField,
                                                       passwordTextField,
                                                       passwordAgainTextField,
                                                       signUpButton
                                                      ])
        
        stackView.axis = .vertical
        stackView.spacing = 52
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        addSubview(imageView)
        addSubview(stackView)
        addSubview(dontHaveAccountButton)
        NSLayoutConstraint.activate([
            
            
            
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            
            emailTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/16),
            emailTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            passwordTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            
            nameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            passwordAgainTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            phoneTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            signUpButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2),
            
            
            
            dontHaveAccountButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dontHaveAccountButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            dontHaveAccountButton.heightAnchor.constraint(equalToConstant: 24),
            dontHaveAccountButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8)
            
            
        ])
    }
    
    
}

