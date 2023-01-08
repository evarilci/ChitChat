//
//  TabBar.swift
//  ChitChat
//
//  Created by Eymen Varilci on 7.01.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray6
        setupViewControllers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.isNavigationBarHidden = true
    }
    
    // Create all of the tabs and icons of the tabs
    func setupViewControllers(){
        viewControllers = [
            createNavigationController(for: ChatViewController(),
                                       title: NSLocalizedString("Chats", comment: ""),
                                       image: UIImage(systemName:"message.fill")!),
//            createNavigationController(for: SearchViewController(),
//                                       title: NSLocalizedString("Search", comment: ""),
//                                       image: UIImage(named:"search")!),
//            createNavigationController(for: ProfileViewController(),
//                                       title: NSLocalizedString("Profile", comment: ""),
//                                       image: UIImage(named:"person")!)
        ]
    }
    
    fileprivate func createNavigationController(for rootViewController: UIViewController,
                                                title: String,
                                                image: UIImage) -> UIViewController{
        // add navigation controller to each tab
        let navigationController = UINavigationController(rootViewController: rootViewController)
        let appearence = UINavigationBarAppearance()
        appearence.configureWithTransparentBackground()
        navigationController.navigationBar.standardAppearance = appearence
        navigationController.navigationBar.scrollEdgeAppearance = appearence
        navigationController.navigationBar.compactAppearance = appearence
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        
        
       // navigationController.navigationBar.c
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navigationController
    }

    
}

