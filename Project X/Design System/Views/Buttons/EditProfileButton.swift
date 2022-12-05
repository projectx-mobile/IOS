//
//  EditProfileButton.swift
//  Project X
//
//  Created by Alinser Shchurko on 10.11.22.
//
import UIKit

final class EditProfileButton: UIButton {

    convenience init() {
        self.init(type: .custom)
        configure()
    }
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: LayoutConstants.duration) {
                self.isHighlighted ? (self.backgroundColor = .black.withAlphaComponent(0.2)) : (self.backgroundColor = .clear)
            }
        }
    }
}
// MARK: - extension
private extension EditProfileButton {
    func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(UIImage(named: "navigation"), for: .normal)
        self.titleLabel?.tintColor = .primaryMidnight
    }
}
