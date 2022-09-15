//
//  SubtitleLabel.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import UIKit

class SubtitleLabel: UILabel {

    convenience init(text: String) {
        self.init()
        self.text = text
        self.textColor = .black
        self.font = .nexaDemoBold24()
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false   
    }
}
