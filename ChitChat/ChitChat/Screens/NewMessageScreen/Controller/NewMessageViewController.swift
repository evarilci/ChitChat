//
//  NewMessageViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 10.01.2023.
//

import UIKit
import Kingfisher

final class NewMessageViewController: UIViewController {

    let mainView = NewMessageView()
    let viewModel = NewMessageViewModel()
    var height : CGFloat?
    var users = [SomeUser]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        viewModel.delegate = self
        mainView.rowHeight = height!
        print(height!)
        mainView.setTableViewDelegates(delegate: self, datasource: self)
        viewModel.fetchUsers { users in
            self.users = users
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
       
    }

}

extension NewMessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.newMessageCellIdentifier) as! NewMessageTableViewCell
        cell.name = self.users[indexPath.row].name
         let url = URL(string: self.users[indexPath.row].photo) 
        cell.profileImage.kf.setImage(with: url)
        cell.profileImageRadius = height!
        return cell
    }
}

extension NewMessageViewController : NewMessageViewModelDelegate {
    func UsersFetchSucceed() {
        DispatchQueue.main.async {
            self.mainView.tableView.reloadData()
        }
    }
    func UsersFetchFailed(_ error: Error) {
        
    }
}
    

