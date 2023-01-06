//
//  HomeViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 7.01.2023.
//

import UIKit
import FirebaseAuth
final class HomeViewController: UIViewController {

    let button : UIButton = {
        let button = UIButton()
        button.setTitle("LOG OUT", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
     
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.addTarget(self, action: #selector(logouttapped), for: .touchUpInside)
        view.backgroundColor = .yellow
    }
    
    @objc func logouttapped() {
        let user = Auth.auth()
        
        do {
            try user.signOut()
            
            let viewModel = authViewModel()
            let ViewController = LoginViewController(viewModel: viewModel)
            ViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(ViewController, animated: true)
           
            print("sign out success")
        } catch  {
            print("sign out failed")
        }
        
    }
  

}
