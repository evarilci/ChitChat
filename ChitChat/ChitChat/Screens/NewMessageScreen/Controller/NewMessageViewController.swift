//
//  NewMessageViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 10.01.2023.
//

import UIKit

final class NewMessageViewController: UIViewController {

    let mainView = NewMessageView()
    var height : CGFloat?
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.rowHeight = height!
        print(height!)
        mainView.setTableViewDelegates(delegate: self, datasource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        print(height!)
    }

}

extension NewMessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.newMessageCellIdentifier) as! NewMessageTableViewCell
        cell.name = "Karl Logan"
        cell.profileImageRadius = height!
        return cell
    }
    
    
    
}
