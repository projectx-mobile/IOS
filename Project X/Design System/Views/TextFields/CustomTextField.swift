//
//  CustomTextField.swift
//  Project X
//
//  Created by Alinser Shchurko on 23.12.22.
//

import UIKit
final class CustomTextField: UITextField {
    var placehold: String = String()
    // MARK: - Initializer
    init(placehold: String) {
        self.placehold = placehold
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    // MARK: - Private methods
    private extension CustomTextField {
         func setup() {
            textFieldSetup()
            setTextFieldStyle()
        }
        private func textFieldSetup() {
            translatesAutoresizingMaskIntoConstraints = false
            self.indent(size: LayoutConstants.width16)
        }
        private func setTextFieldStyle() {
                backgroundColor = .primaryWhiteSnow
            layer.cornerRadius = LayoutConstants.cornerRadius8
                layer.borderWidth = 1.4
                self.textColor = .primaryMidnight
                self.attributedPlaceholder = NSAttributedString(string: placehold,
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.duskGrey, .font: UIFont.robotoRegular12() ?? UIFont()])
                self.font = .robotoMedium14()
        }
    }
