//
//  ComeBackView.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

final class ComeBackView: UIView {
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
        childButton.createCustomViewWithShadow([.topLeft, .topRight, .bottomRight], radius: 12, borderColor: .primaryMidnight, borderWidth: 1.4, fillColor: .primaryWhiteSnow, shadowColor: .primaryMidnight)
        parentButton.createCustomViewWithShadow([.topLeft, .topRight, .bottomLeft], radius: 12, borderColor: .primaryMidnight, borderWidth: 1.4, fillColor: .primaryWhiteSnow, shadowColor: .primaryMidnight)
    }
    private func setupViews() {
        backgroundColor = .primaryWhiteSnow
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(parentButton)
        addSubview(childButton)
    }
    @objc private func childButtonTapped() {
        bringSubviewToFront(childButton)
    }
    @objc private func parentButtonTapped() {
        bringSubviewToFront(parentButton)
    }
    private func setConstraints() {
        NSLayoutConstraint.activate([
            parentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -88),
            parentButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            parentButton.heightAnchor.constraint(equalToConstant: 56),
            parentButton.widthAnchor.constraint(equalToConstant: 160)
        ])
        NSLayoutConstraint.activate([
            childButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -72),
            childButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            childButton.heightAnchor.constraint(equalToConstant: 56),
            childButton.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
}
