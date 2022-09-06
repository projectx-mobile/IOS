//
//  ViewController.swift
//  Project X
//
//  Created by anduser on 30.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let screenWidth = UIScreen.main.bounds.size.height < UIScreen.main.bounds.size.width ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width
    
    private let screenHeight = UIScreen.main.bounds.size.height > UIScreen.main.bounds.size.width ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width
    
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
        addSwipe()
    }
    
    private func setupViews() {
        view.addSubview(signUpButton)
        view.addSubview(logInButton)
        view.addSubview(comeBackView)
        
    }
    
    private func addSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(doSwipe))
        swipe.direction = .down
        swipe.numberOfTouchesRequired = 1
        comeBackView.isUserInteractionEnabled = true
        comeBackView.addGestureRecognizer(swipe)
    }
    
    @objc private func doSwipe() {
        print("swipe")
        UIView.animate(withDuration: 1) {
            self.comeBackView.frame = CGRect(x: 0,
                                             y: self.screenHeight,
                                             width: self.comeBackView.frame.width ,
                                             height: self.comeBackView.frame.height)
        }

    }
    
    @objc private func signUpButtonTapped() {
        print("signUpButtonTapped")
        
    }
    
    @objc private func logInButtonTapped() {
        print("logInButtonTapped")
        UIView.animate(withDuration: 1) {
            self.comeBackView.frame = CGRect(x: 0,
                                             y: (self.screenHeight - self.comeBackView.frame.height),
                                             width: self.comeBackView.frame.width ,
                                             height: self.comeBackView.frame.height)
        }
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

