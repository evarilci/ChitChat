//
//  AuthTextField.swift
//  ChitChat
//
//  Created by Eymen Varilci on 2.01.2023.
//

import UIKit

class AuthTextField: UITextField {
   
    let errorLabel = UILabel()
    
    init(frame: CGRect = .zero, header: String, placeholder: String, backgroundColor: UIColor, error: String) {
        super.init(frame: frame)
        
        self.setAuthTextField(header: header, placeholder: placeholder, color: backgroundColor, error: error)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAuthTextField(header: String ,placeholder: String, color: UIColor, error: String) {
        self.backgroundColor = color
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1.0
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
       
        self.layer.borderColor = UIColor.systemGreen.cgColor
        self.placeholder = placeholder
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftViewMode = .always
        self.translatesAutoresizingMaskIntoConstraints = false
        
       
          let headerLabel = UILabel()
        headerLabel.text = header
        headerLabel.textColor = UIColor.secondaryLabel
        
        
        headerLabel.font = UIFont(name: "Helvetica", size: 20)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        errorLabel.text = error
        errorLabel.textColor = UIColor.systemRed
        errorLabel.textAlignment = .left
        errorLabel.font = UIFont(name: "Helvetica", size: 15)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerLabel)
        addSubview(errorLabel)
        NSLayoutConstraint.activate([
            
          
            

            headerLabel.bottomAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            headerLabel.widthAnchor.constraint(equalToConstant: 125),
            headerLabel.heightAnchor.constraint(equalToConstant: 30),

         
            
            errorLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 3),
            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            errorLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -8),
        ])

        
            }
}
