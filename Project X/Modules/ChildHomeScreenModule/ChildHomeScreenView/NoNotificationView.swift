//
//  NoNotificationView.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 25.10.22.
//

import UIKit

final class NoNotificationView: UIView {
    private let notificationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noNotifications")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primaryMidnight
        label.font = .robotoRegular13()
        label.textAlignment = .left
        label.text = "Супер! Нет новых уведомлений."
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
}

// MARK: - Private extension
private extension NoNotificationView {
    func setupViews() {
        backgroundColor = .primaryPureWhite
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = LayoutConstants.cornerRadius10
        layer.borderWidth = LayoutConstants.borderWidth
        layer.borderColor = UIColor.lavanderGrey.cgColor
        addSubview(notificationImageView)
        addSubview(notificationLabel)
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
    }
}
