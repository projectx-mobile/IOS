//
//  TitleLabel.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

final class TitleLabel: UILabel {
    
    convenience init(text: String) {
        self.init()
        configure(with: text)
    }
    
    private func configure(with text: String) {
        self.text = text
        self.textColor = .primaryMidnight
        self.font = .nexaDemoBold32()
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
