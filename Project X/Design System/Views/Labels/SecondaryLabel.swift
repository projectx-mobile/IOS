//
//  SecondaryLabel.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

final class SecondaryLabel: UILabel {

    convenience init(text: String) {
        self.init()
        configure(with: text)
    }
}

//MARK: - Private extension
private extension SecondaryLabel {
    private func configure(with text: String) {
        self.text = text
        self.textColor = .duskGrey
        self.font = .robotoRegular14()
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
