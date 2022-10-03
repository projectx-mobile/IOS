//
//  CustomButton.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

final class CustomButton: UIButton {
    
    convenience init(text: String = "") {
        self.init(type: .custom)
        configure(with: text)
    }
    
    private func configure(with text: String) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .nexaDemoBold16()
        self.setTitleColor(.primaryMidnight, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: LayoutConstants.duration) {
                self.layer.shadowOpacity = self.isHighlighted ? 0 : 1
            }
        }
    }
}
