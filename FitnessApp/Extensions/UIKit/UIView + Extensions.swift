//
//  UIView + Extensions.swift
//  FitnessApp
//
//  Created by Василий Васильевич on 15.04.2023.
//

import UIKit

extension UIView {

    func addShadowOnView() {

        layer.shadowColor = UIColor.gray.cgColor
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0.0 , height: 3.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1.0
    }
}
