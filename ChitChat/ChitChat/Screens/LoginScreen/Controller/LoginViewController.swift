//
//  ViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 2.01.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    // MARK: Properties
    let mainView = LoginView()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGradientWith([UIColor.systemGray6.cgColor, UIColor.systemIndigo.cgColor], in: [0,1])
        view = mainView
        
       
        
        
    }
    
   
}

