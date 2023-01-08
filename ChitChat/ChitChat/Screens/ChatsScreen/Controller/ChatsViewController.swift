//
//  ChatsViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 7.01.2023.
//

import UIKit

final class ChatViewController: UIViewController {

    let mainView = ChatView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setTableViewDelegates(delegate: self, datasource: self)
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


// MARK: UITableViewDelegate && UITableViewDataSource
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.chatCellIdentifier, for: indexPath) as! ChatTableViewCell
        cell.name = "Eymen Varilci"
        cell.message = "This is a dummy message."
        //cell.image = UIImage(named: "eric")!
        
        return cell
    }
    
    
}
