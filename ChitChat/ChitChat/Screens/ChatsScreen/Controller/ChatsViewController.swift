//
//  ChatsViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 7.01.2023.
//

import UIKit

final class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBarButton()
    }
    private func configureBarButton(){
        let barButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(compose))
        self.navigationItem.rightBarButtonItem = barButton
    }
    @objc func compose() {
        print("newMessage")
    }
}
