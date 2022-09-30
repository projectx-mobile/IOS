//
//  CustomLoginButton.swift
//  Project X
//
//  Created by Dmitriy Eni on 12.09.2022.
//

import UIKit

final class LoginButton: UIButton {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .robotoMedium16()
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textLabel)
        addSubview(iconImageView)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.borderWidth = 1.4
        layer.borderColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        layer.shadowColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 0
        layer.shadowOffset = CGSize(width: 2.5, height: 3)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configurate(with viewModel: CustomLoginButtonViewModel) {
        textLabel.text = viewModel.textLabel
        textLabel.textColor = viewModel.tintColor
        iconImageView.image = UIImage(named: viewModel.imageView)
        layer.backgroundColor = viewModel.backgroundColor.cgColor
    }
    
    private func setupLayout() {
        textLabel.sizeToFit()
        let iconSize: CGFloat = 24
        let xPosition: CGFloat = (frame.size.width - textLabel.frame.size.width - iconSize - 5) / 2
        iconImageView.frame = CGRect(x: xPosition,
                                     y: (frame.size.height - iconSize) / 2,
                                     width: iconSize,
                                     height: iconSize)
        textLabel.frame = CGRect(x: xPosition + iconSize + 10,
                                 y: 0,
                                 width: textLabel.frame.size.width,
                                 height: frame.size.height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1) {
                self.layer.shadowOpacity = self.isHighlighted ? 0 : 1
            }
        }
    }
}
