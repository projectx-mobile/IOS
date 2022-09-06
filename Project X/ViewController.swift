//
//  ViewController.swift
//  Project X
//
//  Created by anduser on 30.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var logInButton: UIButton = {
       
        let button = PrimaryButton(text: "Войти", fillColor: .primaryWhiteSnow, tintColor: .primaryMidnight, borderColor: .primaryMidnight)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        
        let button = PrimaryButton(text: "Создать аккаунт", fillColor: .primaryJuicyGrape, tintColor: .primaryPureWhite, borderColor: .primaryMidnight)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
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

