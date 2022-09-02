//
//  UIView + Extension.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 31.08.22.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.primaryMidnight.cgColor
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 2.5, height: 3.0)
        layer.shadowOpacity = 1
        layer.shadowRadius = 0
    }
    
}
