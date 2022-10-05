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

class NotificationView: UIView {
    private let notificationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noNotifications")
        imageView.bounds.size = CGSize(width: LayoutConstants.width20, height: LayoutConstants.height20)
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
    }
    
    func noNotificationsSetup() {
        layer.cornerRadius = LayoutConstants.cornerRadius10
        layer.borderWidth = LayoutConstants.borderWidth
        layer.borderColor = UIColor.lavanderGrey.cgColor
        notificationLabel.text = "Супер! Нет новых уведомлений."
        notificationImageView.image = UIImage(named: "noNotifications")
        closeButton.isHidden = true
        closeButton.isUserInteractionEnabled = false
    }
    
    func configureWithText(text: String) {
        notificationLabel.text = text
        notificationImageView.image = UIImage(named: "notification")
    }
    
    @objc private func closeButtonTapped() {
        closeDelegate?.closeButtonTapped()
    }
}

//MARK: - Private extension
private extension NotificationView {
    func setupViews() {
        backgroundColor = .primaryPureWhite
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(notificationImageView)
        addSubview(notificationLabel)
        addSubview(closeButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            notificationImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.inset18),
            notificationImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
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
            closeButton.heightAnchor.constraint(equalToConstant: 8),
            closeButton.widthAnchor.constraint(equalToConstant: 8)
        ])
    }
}
