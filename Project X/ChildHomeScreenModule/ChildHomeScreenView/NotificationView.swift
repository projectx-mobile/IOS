//
//  NotificationView.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import UIKit

class NotificationView: UIView {
    let noKidsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noNotifications")
        imageView.bounds.size = CGSize(width: LayoutConstants.width20, height: LayoutConstants.height20)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primaryMidnight
        label.font = .robotoRegular13()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    }
    
    func configureWithText(text: String) {
        notificationLabel.text = text
    }
}

//MARK: - Private extension
private extension NotificationView {
    func setupViews() {
        backgroundColor = .primaryPureWhite
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(noKidsImageView)
        addSubview(notificationLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            noKidsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.inset18),
            noKidsImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            notificationLabel.leadingAnchor.constraint(equalTo: noKidsImageView.trailingAnchor, constant: LayoutConstants.inset10),
            notificationLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            notificationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutConstants.inset55),
            notificationLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.height24)
        ])
    }
}
