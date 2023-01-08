//
//  ChatsTableView.swift
//  ChitChat
//
//  Created by Eymen Varilci on 8.01.2023.
//

import UIKit

final class ChatView: UIView {
    
    
     var tableView = UITableView()
     
     
    init() {
        super.init(frame: .zero)
        setTableViewConstraints()
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: K.chatCellIdentifier)
        tableView.rowHeight = 100
    }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     func setTableViewDelegates(delegate Delegate: UITableViewDelegate, datasource DataSource: UITableViewDataSource) {
         
         tableView.delegate = Delegate
         tableView.dataSource = DataSource
     }
     
     func setTableViewConstraints() {
         addSubview(tableView)
         tableView.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
         
         
         ])
     }
    



}

