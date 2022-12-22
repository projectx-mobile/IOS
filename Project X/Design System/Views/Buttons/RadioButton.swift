//
//  RadioButton.swift
//  Project X
//
//  Created by Alinser Shchurko on 22.12.22.
//

import UIKit
final class RadioButton: UIButton {
    var text: String
    init(text: String) {
        self.text = text
        super.init(frame: .zero)
        setupButton(text: text)
        constraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension RadioButton {
    func setupButton( text: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(UIImage(named: "selectedNo"), for: .normal)
        self.setImage(UIImage(named: "selectedYes"), for: .selected)
        self.setTitle(text, for: .normal)
        self.setTitleColor(.black, for: .normal)
    }
    func constraints() {
     
        self.imageView?.widthAnchor.constraint(equalToConstant: LayoutConstants.inset24).isActive = true
        self.imageView?.heightAnchor.constraint(equalToConstant: LayoutConstants.inset24).isActive = true
        self.imageView?.trailingAnchor.constraint(equalTo: titleLabel!.leadingAnchor, constant: -LayoutConstants.inset10).isActive = true
        self.imageView?.contentMode = .left
    }
}
