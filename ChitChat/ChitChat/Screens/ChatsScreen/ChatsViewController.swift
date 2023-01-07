//
//  ChatsViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 7.01.2023.
//

import UIKit
import FirebaseAuth
final class ChatViewController: UIViewController {

    let button : UIButton = {
        let button = UIButton()
        button.setTitle("LOG OUT", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -3).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        button.addTarget(self, action: #selector(logouttapped), for: .touchUpInside)
        
    }
    
    @objc func logouttapped() {
        let user = Auth.auth()
        
        do {
            try user.signOut()
            
            let viewModel = authViewModel()
            let ViewController = AuthViewController(viewModel: viewModel)
            ViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(ViewController, animated: true)
           
            print("sign out success")
        } catch  {
            print("sign out failed")
        }
        
    }
  

}
