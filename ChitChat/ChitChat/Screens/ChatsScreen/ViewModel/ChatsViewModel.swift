//
//  ChatsViewModel.swift
//  ChitChat
//
//  Created by Eymen Varilci on 9.01.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth


protocol ChatsViewModelDelegate: AnyObject {
    func profilePhotoFetchSucceed()
    func profilePhotoFetchFailed(_ error: Error)
   
}

protocol ChatsViewModelProtocol {
    var delegate : ChatsViewModelDelegate? { get set }
    func fetchProfile()
}

final class ChatsViewModel : ChatsViewModelProtocol {
    var user : User?
    var image : UIImage? {
        didSet {
            delegate?.profilePhotoFetchSucceed()
        }
    }
    weak var delegate: ChatsViewModelDelegate?
    
    var db: Firestore {
        Firestore.firestore()
    }
    
    var auth: Auth {
        Auth.auth()
    }
    var storage: Storage {
        Storage.storage()
    }
    
    var StorageMetadata: StorageMetadata {
        FirebaseStorage.StorageMetadata()
    }
    
    func fetchProfile() {
        db.collection(K.firestore.userCollection).addSnapshotListener { snapshot, error in
            if let e = error {
                self.delegate?.profilePhotoFetchFailed(e)
            } else {
                guard let snapshotDocuments = snapshot?.documents else {return}
                for doc in snapshotDocuments {
                    if let message = doc.get(K.firestore.photo) as? String {
                        guard let url = URL(string: message) else {return}
                        let downloadTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                            if error != nil {
                                guard let self = self else {return}
                                self.delegate?.profilePhotoFetchFailed(error!)
                            } else {
                                self?.image = UIImage(data: data!)
                            }
                        }
                        downloadTask.resume()
                    }
                }
            }
        }
    }
}
