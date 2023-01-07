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
    var imageSelectAction : (() -> Void)? = nil
   
    var name: String {
        get {
            if nameTextField.text != "" {
                nameTextField.errorLabel.text = ""
                return nameTextField.text!
            } else {
                nameTextField.errorLabel.text = "Enter your name"
                return ""
            }
        }
        
    }
    
    var email: String {
        get {
            if emailTextField.text != "" {
                emailTextField.errorLabel.text = ""
                return emailTextField.text!
            } else {
                emailTextField.errorLabel.text = "An email address must be provided"
                return ""
            }
        }
        set {
            emailTextField.errorLabel.text = newValue
        }
    }
    
    var password: String {
        get {
            if passwordTextField.text != "" && passwordTextField.text!.count >= 6 && passwordTextField.text == passwordAgainTextField.text {
                passwordAgainTextField.errorLabel.text = ""
                passwordTextField.errorLabel.text = ""
               return passwordTextField.text!
            } else if passwordTextField.text != passwordAgainTextField.text {
                passwordAgainTextField.errorLabel.text = "Passwords don't match"
                return ""
            } else {
                passwordTextField.errorLabel.text = ""
                passwordAgainTextField.errorLabel.text = ""
               return passwordAgainTextField.text!
                
            }
        }
        set {
            passwordTextField.errorLabel.text = newValue
        }
    }
    
    
    var phone: String {
        get {
            if phoneTextField.text != "" {
                phoneTextField.errorLabel.text = ""
                return phoneTextField.text!
            } else {
                phoneTextField.errorLabel.text = "Phone number must be provided."
                return ""
            }
            
        }
    }
    
    var photo: String {
        get {
            ""
        }
    }
    
     let choosePhotoButton: UIButton = {
        let button = UIButton()
        button.tintColor = .systemGreen
        button.setImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        button.setTitle("Register", for: .normal)
        button.setTitle("Register", for: .highlighted)
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
        passwordAgainTextField.isSecureTextEntry = true
        emailTextField.errorLabel.text = ""
        passwordTextField.errorLabel.text = ""
        nameTextField.errorLabel.text = ""
        phoneTextField.errorLabel.text = ""
        passwordAgainTextField.errorLabel.text = ""
        
        dontHaveAccountButton.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        choosePhotoButton.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
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
    @objc func chooseImage() {
        imageSelectAction?()
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
        
        
        
        addSubview(choosePhotoButton)
       // addSubview(imageView)
        addSubview(stackView)
        addSubview(dontHaveAccountButton)
        NSLayoutConstraint.activate([
            
            
            
            choosePhotoButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            choosePhotoButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            choosePhotoButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4),
            choosePhotoButton.heightAnchor.constraint(equalTo: choosePhotoButton.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: choosePhotoButton.bottomAnchor, constant: 16),
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

