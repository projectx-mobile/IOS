//
//  TaskDescriptionButton.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 13.10.22.
//

import UIKit

final class TaskDescriptionButton: UIButton {
    
    convenience init(text: String = "") {
        self.init(type: .custom)
        configure(with: text)
    }

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = .primaryJuicyGrape
            setTitleColor(.white, for: .normal)
            }
        }
}

//MARK: - Private extension
private extension TaskDescriptionButton {
    func configure(with text: String) {
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .nexaDemoBold12()
        self.setTitleColor(.primaryMidnight, for: .normal)
        self.backgroundColor = .primaryWhiteSnow
        self.layer.borderWidth = LayoutConstants.borderWidth
        self.layer.borderColor = UIColor.primaryMidnight.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = LayoutConstants.cornerRadius6
        self.contentEdgeInsets = UIEdgeInsets(top: 9.0, left: 10.0, bottom: 9.0, right: 10.0)
    }
}
