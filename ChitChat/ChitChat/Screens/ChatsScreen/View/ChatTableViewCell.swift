//
//  ChatTableViewCell.swift
//  ChitChat
//
//  Created by Eymen Varilci on 8.01.2023.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    var message: String? {
        set {
            latestMessage.text = newValue
        }
        get {
            latestMessage.text
        }
    }
    
    var name: String? {
        set {
            nameLabel.text = newValue
        }
        get {
            nameLabel.text
        }
    }
    
    var image: UIImage? {
        set {
            profileImage.image = newValue
        }
        get {
            profileImage.image
        }
    }
    
// MARK: VIEWS
    private lazy var profileImage : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
       // view.backgroundColor = .gray
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var latestMessage : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = UIColor.secondaryLabel
        label.font = UIFont(name: "Helvetica", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: Init
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        profileImage.layer.cornerRadius = ((UIScreen.main.bounds.height / 9) - 8) / 2
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout method
    private func configureLayout() {
        addSubview(profileImage)
        addSubview(latestMessage)
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            // profile image layout
            profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            profileImage.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -8),
            profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor),
            
            // nameLabel layout
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            // last message label layout
            latestMessage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            latestMessage.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 12),
            latestMessage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            latestMessage.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
}
