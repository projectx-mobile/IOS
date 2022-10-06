//
//  NotificationView.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import UIKit

protocol CloseProtocol: AnyObject {
    func closeButtonTapped()
}

final class NotificationView: UIView {
    private let notificationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "notification")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primaryMidnight
        label.font = .robotoRegular13()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "close")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .primaryMidnight
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    weak var closeDelegate: CloseProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createCustomView([.topLeft, .topRight, .bottomRight], radius: LayoutConstants.cornerRadius10, borderColor: .primaryMidnight, borderWidth: LayoutConstants.borderWidth, fillColor: .notifications)
    }

    func configureWithText(text: String) {
        notificationLabel.text = text
    }
    
    @objc private func closeButtonTapped() {
        closeDelegate?.closeButtonTapped()
    }
}

//MARK: - Private extension
private extension NotificationView {
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(notificationImageView)
        addSubview(notificationLabel)
        addSubview(closeButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            notificationImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.inset18),
            notificationImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            notificationImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.width20),
            notificationImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.height20)
        ])
        
        NSLayoutConstraint.activate([
            notificationLabel.leadingAnchor.constraint(equalTo: notificationImageView.trailingAnchor, constant: LayoutConstants.inset10),
            notificationLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            notificationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutConstants.inset55),
            notificationLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.height24)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutConstants.inset24),
            closeButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height8),
            closeButton.widthAnchor.constraint(equalToConstant: LayoutConstants.width8)
        ])
    }
}
