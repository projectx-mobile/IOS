//
//  SecondaryLabelWithIcon.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//


import UIKit

final class SecondaryLabelWithIcon: UILabel {

    convenience init(text: String) {
        self.init()
        configure(with: text)
    }
}

//MARK: - Private extension
private extension SecondaryLabelWithIcon {
    private func configure(with text: String) {
        self.textColor = .duskGrey
        self.font = .robotoRegular14()
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named:"right")
        let imageOffsetY: CGFloat = -LayoutConstants.imageOffset2
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "")
        let textBeforeIcon = NSAttributedString(string: text)
        let spacer = NSAttributedString(string: "   ")
        completeText.append(textBeforeIcon)
        completeText.append(spacer)
        completeText.append(attachmentString)

        self.attributedText = completeText
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
