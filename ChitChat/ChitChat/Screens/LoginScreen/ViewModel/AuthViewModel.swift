//
//  AuthViewModel.swift
//  ChitChat
//
//  Created by Eymen Varilci on 5.01.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

protocol AuthViewModelDelegate: AnyObject {
    func signInErrorOcurred(_ error: Error)
    func signUpErrorOccured(_ error: Error)
    func authSucceded()
}

protocol AuthViewModelProtocol {
    var delegate: AuthViewModelDelegate? { get set }
    
    func createUser(name: String, email: String, password: String, phone: String, photoURL: String, photo: UIImage, completion: @escaping(Result<User,Error>) -> Void)
    func signIn(email: String, password: String, completion: @escaping(Result<User,Error>) -> Void)
}

final class authViewModel: AuthViewModelProtocol {
    
    // MARK: delegate
    weak var delegate: AuthViewModelDelegate?
    
    
    // MARK: Firebase properties
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
    
    // MARK: Auth methods
    //SIGN UP
    func createUser(name: String, email: String, password: String, phone: String, photoURL: String, photo: UIImage, completion: @escaping (Result<User, Error>) -> Void) {
        let imageID = UUID().uuidString
        
        DispatchQueue.main.async {
            self.auth.createUser(withEmail: email, password: password) {[weak self] result, error in
                if let e = error {
                    self?.delegate?.signUpErrorOccured(e)
                } else {
                    guard let userID = self?.auth.currentUser?.uid else {return}
                    let user = User(id: userID ,name: name, email: email, phone: phone, photo: photoURL)
                   // create referance in storage and upload photo
                    let referance = self?.storage.reference(withPath:  "\(userID)media/profile_image/\(imageID).jpeg" )
                    let image = photo.jpegData(compressionQuality: 0.7)
                    referance!.putData(image!) { metadata, error in
                        referance?.downloadURL(completion: { url, error in // get photo url from storage to add to firestore
                            if error != nil {
                                self?.delegate?.signUpErrorOccured(error!)
                            } else {
                                guard let url = url?.absoluteString else {return} // image url from storage
                                
                                self?.db.collection(K.firestore.userCollection).document(userID).setData([K.firestore.id : user.id,
                                                                                       K.firestore.name : user.name,
                                                                                       K.firestore.email : user.email,
                                                                                       K.firestore.phone : user.phone,
                                                                                       K.firestore.photo : url], completion: { error in
                                    //
                                    guard error == nil else {
                                        self?.delegate?.signUpErrorOccured(error!)
                                        return
                                    }
                                    self?.delegate?.authSucceded()
                                })
                            }
                        })
                    }
                }
            }
        }
    }
    // SIGN IN
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        self.auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            if error != nil {
                self?.delegate?.signInErrorOcurred(error!)
            } else {
                self?.delegate?.authSucceded()
            }
        }
    }
}


