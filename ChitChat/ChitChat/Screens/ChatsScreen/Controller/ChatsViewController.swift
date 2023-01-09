//
//  ChatsViewController.swift
//  ChitChat
//
//  Created by Eymen Varilci on 7.01.2023.
//

import UIKit

final class ChatViewController: UIViewController {

    let mainView = ChatView()
    let viewModel = ChatsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        viewModel.delegate = self
        viewModel.fetchProfilePhoto()
        mainView.setTableViewDelegates(delegate: self, datasource: self)
        configureBarButton()
        
       
    }
    private func configureBarButton(){
        let barButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(compose))
        self.navigationItem.rightBarButtonItem = barButton
    }
    @objc func compose() {
        print("newMessage")
    }
}


// MARK: UITableViewDelegate && UITableViewDataSource
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.chatCellIdentifier, for: indexPath) as! ChatTableViewCell
        cell.name = "Eymen Varilci"
        cell.message = "This is a dummy message."
        //cell.image = viewModel.image
        return cell
    }
    
    
}

extension ChatViewController: ChatsViewModelDelegate {
    func profilePhotoFetchSucceed() {
        DispatchQueue.main.async {
            let width = 30 // choose the image width
            let height = 30 // choose the image height
           
            let titleView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44)) //44 is the standard size of the top bar
            let imageView = UIImageView(frame: CGRect(x: 0, y: (44 - height)/2, width: width, height: height))
            imageView.contentMode = .scaleAspectFit //choose other if it makes sense
            imageView.layer.cornerRadius = CGFloat(height / 2)
            imageView.clipsToBounds = true
            imageView.image = self.viewModel.image
            titleView.addSubview(imageView)
            self.navigationItem.titleView = titleView
        }
       
    }
    
    func profilePhotoFetchFailed(_ error: Error) {
        print("pp failed")
    }
    
    
}
