//
//  CustomButton.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 12.09.22.
//

import UIKit

final class CustomButton: UIButton {
    
    convenience init(text: String = "") {
        self.init(type: .custom)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .nexaDemoBold16()
        self.setTitleColor(.primaryMidnight, for: .normal)
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

