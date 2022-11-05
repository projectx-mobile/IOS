//
//  AvatarIcon.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
import UIKit
final class AvatarIcon: UIButton {
    convenience init(userName: String, image: UIImage?) {
        self.init()
        setAvatarIcon(userName: userName, img: image)
    }
}

private extension AvatarIcon {
    func setAvatarIcon(userName: String, img: UIImage?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.primaryMidnight.cgColor
        self.titleLabel?.textAlignment = .center
        let size = CGSize(width: 56, height: 56)
        self.frame.size = size
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        guard let img = img else {
            self.backgroundColor = UIColor(red: 208/255, green: 192/255, blue: 245/255, alpha: 1)
            self.setTitle(userName.first?.uppercased(), for: .normal)
            self.titleLabel?.font = UIFont.nexaDemoBold24()
            self.setTitleColor( .primaryMidnight, for: .normal)
            return }
        self.setImage(img, for: .normal)
        self.contentMode = .scaleAspectFit
    }
}
