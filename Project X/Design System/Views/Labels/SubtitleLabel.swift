//
//  SubtitleLabel.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

final class SubtitleLabel: UILabel {

    convenience init(text: String) {
        self.init()
        configure(with: text)
    }
    
    private func configure(with text: String) {
        self.text = text
        self.textColor = .black
        self.font = .nexaDemoBold24()
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
