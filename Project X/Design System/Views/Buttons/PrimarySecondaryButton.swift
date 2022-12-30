//
//  SecondaryButton.swift
//  Project X
//
//  Created by Alinser Shchurko on 29.12.22.
//

import UIKit
final class PrimarySecondaryButton: UIButton {
     var title: String = ""
    // MARK: - Initializer
     init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var isHighlighted: Bool {
        didSet {
            self.layer.shadowOpacity = self.isHighlighted ? 0 : 1
        }
    }
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.backgroundColor = .primaryJuicyGrape
                self.layer.cornerRadius = LayoutConstants.cornerRadius8
                self.layer.borderWidth = 1.4
                self.layer.borderColor = UIColor.primaryMidnight.cgColor
                self.layer.shadowColor = UIColor.primaryMidnight.cgColor
                self.layer.shadowOpacity = 1.0
                self.layer.shadowRadius = 0.0
                self.layer.shadowOffset = CGSize(width: 2.5, height: 3)
                self.titleLabel?.font = UIFont.robotoMedium16()
                self.isEnabled = true
            } else {
                setDesignButton()
            }
        }
    }
}
// MARK: - Private methods
private extension PrimarySecondaryButton {
     func setup() {
        setDesignButton()
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
    }
     func setDesignButton() {
        self.layer.borderWidth = 1.4
         self.layer.cornerRadius = LayoutConstants.cornerRadius8
        self.backgroundColor = .duskGrey
        self.titleLabel?.font = .robotoMedium16()
        self.setTitleColor(.white, for: .normal)
        self.isEnabled = false
    }
}
