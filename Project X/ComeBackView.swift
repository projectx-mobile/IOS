//
//  ComeBackView.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 1.09.22.
//

import UIKit

class ComeBackView: UIView {
    
    private lazy var childButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .primaryWhiteSnow
        button.setTitle("Ребенок", for: .normal)
        button.titleLabel?.font = .nexaDemoBold16()
        button.tintColor = .primaryMidnight
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(childButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var parentButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .primaryWhiteSnow
        button.setTitle("Родитель", for: .normal)
        button.titleLabel?.font = .nexaDemoBold16()
        button.tintColor = .primaryMidnight
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(parentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var childButtonShadowView: UIView = {
        let shadowView = UIView()
        shadowView.backgroundColor = .primaryMidnight
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        return shadowView
    }()
    
    private var parentButtonShadowView: UIView = {
        let shadowView = UIView()
        shadowView.backgroundColor = .primaryMidnight
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        return shadowView
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
        
        childButton.roundCorners([.topLeft, .topRight, .bottomRight], radius: 12, borderColor: .primaryMidnight, borderWidth: 1.4)
        parentButton.roundCorners([.topLeft, .topRight, .bottomLeft], radius: 12, borderColor: .primaryMidnight, borderWidth: 1.4)
        childButtonShadowView.roundCorners([.topLeft, .topRight, .bottomRight], radius: 12, borderColor: nil, borderWidth: nil)
        parentButtonShadowView.roundCorners([.topLeft, .topRight, .bottomLeft], radius: 12, borderColor: nil, borderWidth: nil)
    }
    
    private func setupViews() {
        
        backgroundColor = .primaryWhiteSnow
        //backgroundColor = .orange
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(parentButtonShadowView)
        addSubview(parentButton)
        addSubview(childButtonShadowView)
        addSubview(childButton)
    }
    
    @objc private func childButtonTapped() {
        print("childButtonTapped")
    }
    
    @objc private func parentButtonTapped() {
        print("parentButtonTapped")
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
        
        NSLayoutConstraint.activate([
            childButtonShadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -69),
            childButtonShadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 34.5),
            childButtonShadowView.heightAnchor.constraint(equalToConstant: 56),
            childButtonShadowView.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            parentButtonShadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -85),
            parentButtonShadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -29.5),
            parentButtonShadowView.heightAnchor.constraint(equalToConstant: 56),
            parentButtonShadowView.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
}
