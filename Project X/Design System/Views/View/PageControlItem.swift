//
//  PageControlItem.swift
//  Project X
//
//  Created by Александра Захаревич on 31.10.22.
//

import UIKit

final class PageControlItem: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
}

//MARK: - Private extension
private extension PageControlItem {
    private func configure() {
//      backgroundColor = .systemPink
        layer.cornerRadius = 4
        layer.borderWidth = 1.2
        layer.borderColor = UIColor.primaryMidnight.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 40).isActive = true
        heightAnchor.constraint(equalToConstant: 8).isActive = true
    }
}
