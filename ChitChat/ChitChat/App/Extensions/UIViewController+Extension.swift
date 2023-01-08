//
//  UIViewController+Extension.swift
//  ChitChat
//
//  Created by Eymen Varilci on 2.01.2023.
//

import UIKit
import JGProgressHUD

extension UIViewController {
    func addGradientWith(_ colors: [CGColor], in locations: [NSNumber]) {
        let gradient = CAGradientLayer()
        gradient.locations = locations
        gradient.colors = colors
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
    }
   
    
    func showProgressHud(_ showingHud: Bool) {
        let progressHud = JGProgressHUD(automaticStyle: ())
        progressHud.textLabel.text = "Please wait"
        progressHud.vibrancyEnabled = true
        showingHud ? progressHud.show(in: view, animated: true) : progressHud.dismiss(animated: true)
    }
    
}
