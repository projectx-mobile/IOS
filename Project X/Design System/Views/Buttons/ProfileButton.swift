//
//  ProfileButton.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
import UIKit

// MARK: Class sample button for profile user disp
final class ProfileButton: UIButton {
    // MARK: Properties
    let leftIcon: UIImage?
    let titleLab: String
    let disclosureIndicator = UIImage(named: "disclosureRight")
    // MARK: Width ancors
    private let widthConstraintsForButton = 32.0
    // MARK: Init
    init(leftIcon: UIImage?, title: String) {
        self.leftIcon = leftIcon
        self.titleLab = title
        super.init(frame: .zero)
        self.setButton(leftIcon: leftIcon, title: title)
        constraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

  private extension ProfileButton {
    private func setButton(leftIcon: UIImage?, title: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        // MARK: Check button
        backgroundColor = .primaryWhiteSnow
        setTitle(title, for: .normal)
        setTitleColor(.primaryMidnight, for: .normal)
        self.setImage(disclosureIndicator?.withTintColor(.primaryMidnight, renderingMode: .alwaysOriginal), for: .normal)
        self.setImage(disclosureIndicator?.withTintColor(UIColor(red: 192/255, green: 193/255, blue: 210/255, alpha: 1), renderingMode: .alwaysOriginal), for: .disabled) // lavander color
        // titleLabel set
        self.setTitleColor(.primaryMidnight, for: .normal)
        self.setTitleColor(.primaryMidnight, for: .disabled)
        self.titleLabel?.font = UIFont(name: "Roboto-medium", size: 14)
        self.titleLabel?.textAlignment = .left
        // icons set
        let iconImage = UIImageView()
        iconImage.frame = CGRect(x: 16, y: 19.5, width: 20.0, height: 17.0)
        iconImage.image = leftIcon?.withTintColor(.primaryMidnight, renderingMode: .alwaysOriginal)
        iconImage.contentMode = .center
        // self setup
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1.4
        self.layer.borderColor = UIColor.primaryMidnight.cgColor
      
        // addSubview
        self.addSubview(iconImage)

    }
   
}
// MARK: Constraints for button
private extension ProfileButton {
    private func constraints() {
        self.heightAnchor.constraint(equalToConstant: LayoutConstants.height56).isActive = true
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - widthConstraintsForButton).isActive = true
        self.imageView?.widthAnchor.constraint(equalToConstant: LayoutConstants.width20).isActive = true
        self.imageView?.heightAnchor.constraint(equalToConstant: LayoutConstants.height17).isActive = true
        self.titleLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: LayoutConstants.inset48).isActive = true
        self.imageView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -LayoutConstants.inset17).isActive = true
        self.titleLabel?.trailingAnchor.constraint(equalTo: self.imageView!.leadingAnchor, constant: -LayoutConstants.inset10).isActive = true
        self.imageView?.leadingAnchor.constraint(equalTo: titleLabel!.trailingAnchor, constant: LayoutConstants.inset20).isActive = true
        imageView?.contentMode = .right
    }
}
