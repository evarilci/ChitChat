//
//  NewMessageViewModel.swift
//  ChitChat
//
//  Created by Eymen Varilci on 10.01.2023.
//
import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

protocol NewMessageViewModelDelegate: AnyObject {
    func UsersFetchSucceed()
    func UsersFetchFailed(_ error: Error)
   
}

protocol NewMessageViewModelProtocol {
    var delegate : NewMessageViewModelDelegate? { get set }
    func fetchUsers(completion: @escaping([SomeUser]) -> Void)
}

final class NewMessageViewModel: NewMessageViewModelProtocol {
    weak var delegate: NewMessageViewModelDelegate?
    
    // MARK: Properties
    
    
    
    var name = [String]() {
        didSet {
            self.delegate?.UsersFetchSucceed()
            print(name.count)
        }
    }
    
    var imageURL = [String]() {
        didSet{
            self.delegate?.UsersFetchSucceed()
            print(imageURL.count)
        }
    }
    
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
    
    func fetchUsers(completion: @escaping([SomeUser]) -> Void) {
        var users = [SomeUser]()
        db.collection(K.firestore.userCollection).getDocuments { [weak self] snapshot, error in
            guard let self else {return}
            guard error == nil else {
                self.delegate?.UsersFetchFailed(error!)
                return
            }
                users = snapshot?.documents.map({ SomeUser(data: $0.data())}) ?? []
                self.delegate?.UsersFetchSucceed()
                completion(users)
        }
    }
    
    func getUsers() {
      //  var users = [User]()
        db.collection(K.firestore.userCollection).addSnapshotListener { snapshot, error in
            if let error {
                self.delegate?.UsersFetchFailed(error)
            } else {
                guard let documents = snapshot?.documents else {return}
                
                for doc in documents {
                    
                    self.name.append(doc.get(K.firestore.name) as! String)
                    self.imageURL.append(doc.get(K.firestore.photo) as! String)
                }
            }
        }
    }
    
}
