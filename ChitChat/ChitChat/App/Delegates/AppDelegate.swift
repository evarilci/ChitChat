//
//  AppDelegate.swift
//  ChitChat
//
//  Created by Eymen Varilci on 2.01.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
 
        setInitialScreen()
        keyboardSetup()

        return true
    }

    func keyboardSetup() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Dismiss"
        IQKeyboardManager.shared.toolbarTintColor = UIColor.systemBlue
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 20
        IQKeyboardManager.shared.layoutIfNeededOnUpdate = true
       
        
    }
    
    func setInitialScreen() {
        let user = Auth.auth().currentUser
        if user != nil {
            window = UIWindow()
            let controller = TabBarViewController()
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
        } else {
            window = UIWindow()
            //let firestoreProtocol : FireStoreAccessibleProtocol = FireStoreAccesible()
            let viewModel = authViewModel()
            let controller = UINavigationController(rootViewController: AuthViewController(viewModel: viewModel))
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
        }
        
    }
    
//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

