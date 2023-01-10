//
//  User.swift
//  ChitChat
//
//  Created by Eymen Varilci on 5.01.2023.
//

import Foundation


struct User {
    let id : String
    let name: String
    let email: String
    let phone: String
    let photo: String
}


struct SomeUser {
    let id : String
    let name: String
    let email: String
    let phone: String
    let photo: String
    
    
    init(data: [String : Any]) {
        self.id = data["uid"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.phone = data["phone"] as? String ?? ""
        self.photo = data["photo"] as? String ?? ""
    }
    
}
