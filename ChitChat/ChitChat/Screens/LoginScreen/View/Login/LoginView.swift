//
//  LoginView.swift
//  ChitChat
//
//  Created by Eymen Varilci on 3.01.2023.
//

import UIKit

final class LoginView: UIView {
    
    var changeViewAction : (() -> Void)? = nil
    var signInAction : (() -> Void)? = nil
    
    var email: String {
        get {
            emailTextField.text ?? "email have not come"
        }
    }
    
    var password: String {
        get {
            passwordTextField.text ?? "password have not come"
        }
    }
    
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setBackgroundColor(UIColor.systemGreen, for: .normal)
        button.setBackgroundColor(UIColor.systemGreen.withAlphaComponent(0.7), for: .highlighted)
        button.setTitle("Sign In", for: .normal)
        button.setTitle("Sign In", for: .highlighted)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.secondaryLabel, for: .normal)
        button.setTitle("Don't you have an account?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let emailTextField = AuthTextField(header:"email" , placeholder: "example@mail.com", backgroundColor: UIColor.systemGray5, error: "error")
    
    private let passwordTextField = AuthTextField(header:"password" , placeholder: "******", backgroundColor: UIColor.systemGray5, error: "error")
  
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "message.fill")!
        imageView.tintColor = UIColor.systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        dontHaveAccountButton.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        self.backgroundColor = UIColor.systemGray6
        layoutSet()
        emailTextField.textContentType = .emailAddress
//        emailTextField.autocorrectionType = .no
//        emailTextField.autocapitalizationType = .none
        passwordTextField.textContentType = .password
        emailTextField.errorLabel.text = ""
        passwordTextField.errorLabel.text = ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    @objc func changeView() {
        changeViewAction?()
    }
    
    @objc func signIn() {
        signInAction?()
    }
    
    func layoutSet() {
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,
                                                      passwordTextField,
                                                      signInButton])
        
        stackView.axis = .vertical
        stackView.spacing = 52
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(dontHaveAccountButton)
        addSubview(stackView)
                NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/16),
            emailTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            passwordTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            signInButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2),
           
            dontHaveAccountButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            dontHaveAccountButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dontHaveAccountButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            dontHaveAccountButton.heightAnchor.constraint(equalToConstant: 24)
            
            
        ])
    }
    
    
}
