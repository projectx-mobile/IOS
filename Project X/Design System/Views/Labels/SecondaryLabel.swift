//
//  SecondaryLabel.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import UIKit

class SecondaryLabel: UILabel {

    convenience init(text: String) {
        self.init()
        self.text = text
        self.textColor = .duskGrey
        self.font = .robotoRegular14()
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
