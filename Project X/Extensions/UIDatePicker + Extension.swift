//
//  UIDatePicker + Extension.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 7.10.22.
//

import UIKit

extension UIDatePicker {
    
    private func traverse(view: UIView) {
        for subview in view.subviews {
            self.traverse(view: subview)
            subview.alpha = 0.02
        }
    }

    func paintClear() {
        self.traverse(view: self)
    }
}
