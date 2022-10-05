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
        configure(with: text, and: fillColor, and: tintColor, and: borderColor)
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: LayoutConstants.duration) {
                self.layer.shadowOpacity = self.isHighlighted ? 0 : 1
            }
        }
    }
}

//MARK: - Private extension
private extension PrimaryButton {
    private func configure(with text: String, and fillColor: UIColor, and tintColor: UIColor, and borderColor: UIColor ) {
        self.backgroundColor =  fillColor
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .robotoBold16()
        self.setTitleColor(tintColor, for: .normal)
        self.setTitleColor(tintColor, for: .highlighted)
        self.layer.cornerRadius = LayoutConstants.cornerRadius8
        self.layer.borderWidth = LayoutConstants.borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.addShadowOnView()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
