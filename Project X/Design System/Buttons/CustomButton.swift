//
//  CustomButton.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 12.09.22.
//

import UIKit

class CustomButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1) {
                self.layer.shadowOpacity = self.isHighlighted ? 0 : 1
            }
        }
    }
}

