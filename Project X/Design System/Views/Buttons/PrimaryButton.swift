//
//  PrimaryButton.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

final class PrimaryButton: UIButton {

    convenience init(text: String = "", fillColor: UIColor, tintColor: UIColor, borderColor: UIColor) {
        self.init(type: .custom)
        self.backgroundColor =  fillColor
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .robotoBold16()
        self.setTitleColor(tintColor, for: .normal)
        self.setTitleColor(tintColor, for: .highlighted)
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1.4
        self.layer.borderColor = borderColor.cgColor
        self.addShadowOnView()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1) {
                self.layer.shadowOpacity = self.isHighlighted ? 0 : 1
            }
        }
    }
}
