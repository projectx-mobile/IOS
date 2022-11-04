//
//  UITextField + Extention.swift
//  Project X
//
//  Created by Alina on 2.11.22.
//

import UIKit

extension UITextField {
    func indent(size: CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
