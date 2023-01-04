//
//  FirebaseAccesible.swift
//  ChitChat
//
//  Created by Eymen Varilci on 5.01.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

protocol FireBaseAccessible {}

extension FireBaseAccessible {
    
    var db: Firestore {
        Firestore.firestore()
    }
    var storage: Storage {
        Storage.storage()
    }
    
    var StorageMetadata: StorageMetadata {
        FirebaseStorage.StorageMetadata()
    }
    var auth: Auth {
        Auth.auth()
    }
}

