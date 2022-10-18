//
//  ComeBackView.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

final class ComeBackView: UIView {
    
    private let titleLabel = SubtitleLabel(text: "С возвращением!")
    private let chooseRoleLabel = SecondaryLabel(text: "Выберите роль для доступа в Трекер Заданий.")
    
    private let separatorUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .lavanderGrey
        view.layer.cornerRadius = LayoutConstants.cornerRadius3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let spotView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "spot")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var childButton: CustomButton = {
        let button = CustomButton(text: "Ребенок")
        button.addTarget(self, action: #selector(childButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var parentButton: CustomButton = {
        let button = CustomButton(text: "Родитель")
        button.addTarget(self, action: #selector(parentButtonTapped), for: .touchUpInside)
        return button
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
        
        childButton.createCustomViewWithShadow([.topLeft, .topRight, .bottomRight], radius: LayoutConstants.shadowRadius12, borderColor: .primaryMidnight, borderWidth: LayoutConstants.borderWidth, fillColor: .primaryWhiteSnow, shadowColor: .primaryMidnight)
        parentButton.createCustomViewWithShadow([.topLeft, .topRight, .bottomLeft], radius: LayoutConstants.shadowRadius12, borderColor: .primaryMidnight, borderWidth: LayoutConstants.borderWidth, fillColor: .primaryWhiteSnow, shadowColor: .primaryMidnight)
    }
    
    @objc private func childButtonTapped() {
        bringSubviewToFront(childButton)
    }
    
    @objc private func parentButtonTapped() {
        bringSubviewToFront(parentButton)
    }
}

//MARK: - Private extension
private extension ComeBackView {
    func setupViews() {
        layer.cornerRadius = LayoutConstants.cornerRadius12
        backgroundColor = .primaryWhiteSnow
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .primaryMidnight
        addSubview(titleLabel)
        chooseRoleLabel.textColor = .primaryMidnight
        chooseRoleLabel.numberOfLines = 0
        chooseRoleLabel.alpha = LayoutConstants.alpha60
        addSubview(chooseRoleLabel)
        addSubview(separatorUnderView)
        spotView.transform = spotView.transform.rotated(by: CGFloat(-0.05))
        addSubview(spotView)
        addSubview(parentButton)
        addSubview(childButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.inset20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.inset16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutConstants.inset16)
        ])
        
        NSLayoutConstraint.activate([
            chooseRoleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutConstants.inset8),
            chooseRoleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.inset16),
            chooseRoleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutConstants.inset16)
        ])
        
        NSLayoutConstraint.activate([
            separatorUnderView.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.inset8),
            separatorUnderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            separatorUnderView.widthAnchor.constraint(equalToConstant: LayoutConstants.width42),
            separatorUnderView.heightAnchor.constraint(equalToConstant: LayoutConstants.height5)
        ])
        
        NSLayoutConstraint.activate([
            spotView.centerYAnchor.constraint(equalTo: centerYAnchor),
            spotView.centerXAnchor.constraint(equalTo: centerXAnchor),
            spotView.widthAnchor.constraint(equalToConstant: LayoutConstants.width242),
            spotView.heightAnchor.constraint(equalToConstant: LayoutConstants.height158)
        ])
        
        NSLayoutConstraint.activate([
            parentButton.topAnchor.constraint(equalTo: spotView.topAnchor, constant: LayoutConstants.inset49),
            parentButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutConstants.inset32),
            parentButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height56),
            parentButton.widthAnchor.constraint(equalToConstant: LayoutConstants.width160)
        ])
        
        NSLayoutConstraint.activate([
            childButton.topAnchor.constraint(equalTo: spotView.topAnchor, constant: LayoutConstants.inset69),
            childButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.inset32),
            childButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height56),
            childButton.widthAnchor.constraint(equalToConstant: LayoutConstants.width160)
        ])
    }
}
