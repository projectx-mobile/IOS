//
//  TitleLabel.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import UIKit

class TitleLabel: UILabel {
    
    convenience init(text: String) {
        self.init()
        self.text = text
        self.textColor = .primaryMidnight
        self.font = .nexaDemoBold32()
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
