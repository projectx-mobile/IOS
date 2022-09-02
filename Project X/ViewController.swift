//
//  ViewController.swift
//  Project X
//
//  Created by anduser on 30.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .primaryJuicyGrape
        button.setTitle("Создать аккаунт", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .primaryPureWhite
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1.4
        button.layer.borderColor = UIColor.primaryMidnight.cgColor
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .primaryWhitSnow
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .primaryMidnight
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1.4
        button.layer.borderColor = UIColor.primaryMidnight.cgColor
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let comeBackView = ComeBackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .primaryPureWhite
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        
        view.addSubview(signUpButton)
        view.addSubview(logInButton)
        view.addSubview(comeBackView)
    }
    
    @objc private func signUpButtonTapped() {
        print("signUpButtonTapped")

    }
    
    @objc private func logInButtonTapped() {
        print("logInButtonTapped")

    }
}

extension ViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -16),
            signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            signUpButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58),
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            comeBackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            comeBackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            comeBackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            comeBackView.heightAnchor.constraint(equalToConstant: 375)
        ])
    }
}

