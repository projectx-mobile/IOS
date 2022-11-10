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
                self.layer.shadowOpacity = self.isHighlighted ? 1 : 0
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
