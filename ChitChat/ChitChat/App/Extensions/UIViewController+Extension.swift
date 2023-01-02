//
//  UIViewController+Extension.swift
//  ChitChat
//
//  Created by Eymen Varilci on 2.01.2023.
//

import UIKit

extension UIViewController {
    func addGradientWith(_ colors: [CGColor], in locations: [NSNumber]) {
        let gradient = CAGradientLayer()
        gradient.locations = locations
        gradient.colors = colors
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
    }
}
