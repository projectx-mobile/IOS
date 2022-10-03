//
//  custom button.swift
//  Project X
//
//  Created by Aliaksey Osipchyk on 20.09.22.
//

import UIKit

final class ButtonForUI: UIButton {
    var title: String = ""
    var style: Style
    //MARK: - Initializer
     init(style: Style, title: String){
        self.style = style
        self.title = title
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    //MARK: - Constants
 extension ButtonForUI {
    enum Style {
        case primary
        case secondary
    }
    enum Corner {
        case large
        case medium
        case small
    }
}
// MARK: - Private methods
private extension ButtonForUI {
    private func setup() {
        buttonSetup()
        setButtonStyle()
    }
    private func buttonSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
    }
    private func setButtonStyle() {
        switch style {
        case .primary:
            backgroundColor = UIColor(red: 0.491, green: 0.271, blue: 1, alpha: 1)
            layer.cornerRadius = 8
            layer.borderWidth = 1.4
            layer.borderColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
            layer.shadowColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
            layer.shadowOpacity = 1
            layer.shadowRadius = 0
            layer.shadowOffset = CGSize(width: 2.5, height: 3)
            titleLabel?.font = UIFont(name: "Roboto-Medium", size: 25)
        case .secondary:
            backgroundColor = .none
            layer.borderWidth = 1
        }
    }
}
