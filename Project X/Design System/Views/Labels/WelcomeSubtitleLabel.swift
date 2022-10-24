//
//  WelcomeSubtitleLabel.swift
//  Project X
//
//  Created by Александра Захаревич on 24.10.22.
//

import UIKit

final class WelcomeSubtitleLabel: UILabel {
    convenience init(text: String) {
        self.init()
        configure(with: text)
    }
}

//MARK: - Private extension
private extension WelcomeSubtitleLabel {
    private func configure(with text: String) {
        self.text = text
        self.textColor = .black
        self.font = .nexaDemoBold32()
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.74
        self.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
