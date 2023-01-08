//
//  ViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 2.01.2023.
//

import UIKit

final class AuthViewController: UIViewController {
    
    // MARK: Properties
    let loginView = LoginView()
    let signUpView = SignUpView()
    let viewModel : authViewModel
    var choosenPhoto : UIImage?
    // MARK: INIT
    init(viewModel: authViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        view = loginView
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        
        
        // BUTTON ACTIONS
        signUpView.changeViewAction = { // change view to login
            self.view = self.loginView
        }
        
        signUpView.imageSelectAction = {
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.delegate = self
            self.present(picker, animated: true)
        }
        
        signUpView.signUpAction = { // signUp action trigger
            self.viewModel.createUser(name: self.signUpView.name, email: self.signUpView.email, password: self.signUpView.password, phone: self.signUpView.phone, photoURL: self.signUpView.photo, photo: self.choosenPhoto ?? UIImage(systemName: "person.crop.circle.fill")!) { result in
                switch result {
                case .success(_):
                    self.authSucceded()
                case.failure(let error):
                    self.signUpErrorOccured(error)
                }
            }
        }
        
        loginView.signInAction = { // login action trigger
            
            self.viewModel.signIn(email: self.loginView.email, password: self.loginView.password) { result in
                switch result {
                case .success(_):
                    self.authSucceded()
                case.failure(let error):
                    self.signInErrorOcurred(error)
                }
            }
        }
        
        loginView.changeViewAction = { // change view to signUp
            self.view = self.signUpView
        }
    }
}

  // MARK: UIImagePickerControllerDelegate && UINavigationControllerDelegate
extension AuthViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        self.signUpView.choosePhotoButton.setImage(image, for: .normal)
        self.signUpView.choosePhotoButton.layer.cornerRadius = (view.frame.width / 4) / 2
        self.signUpView.choosePhotoButton.layer.borderWidth = 1.0
        self.signUpView.choosePhotoButton.layer.borderColor = UIColor.systemGreen.cgColor
        self.signUpView.choosePhotoButton.clipsToBounds = true
        self.choosenPhoto = image
        
        dismiss(animated: true)
    }
}

// MARK: DELEGATE EXTENSION
extension AuthViewController: AuthViewModelDelegate {
    func signInErrorOcurred(_ error: Error) {
        loginView.email = error.localizedDescription
        loginView.password = error.localizedDescription
        print("ERROR CATCHED WHILE SIGN IN: \(error)")
    }
    
    func signUpErrorOccured(_ error: Error) {
        signUpView.password = error.localizedDescription
        print("ERROR CATCHED WHILE SIGN UP: \(error)")
    }
    
    func authSucceded() {
        self.showProgressHud(true)
        DispatchQueue.main.async {
            let ViewController = TabBarViewController()
            ViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(ViewController, animated: true)
           
        }
        self.showProgressHud(false)
    }
}

