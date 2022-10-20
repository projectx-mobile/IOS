//
//  WelcomeTitleLabel.swift
//  Project X
//
//  Created by Александра Захаревич on 19.10.22.
//

import UIKit

final class WelcomeTitleLabel: UILabel {
    convenience init(text: String) {
        self.init()
        configure(with: text)
    }
}

//MARK: - Private extension
private extension WelcomeTitleLabel {
    private func configure(with text: String) {
        self.text = text
        self.textColor = .duskGrey
        self.font = .robotoRegular13()
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
