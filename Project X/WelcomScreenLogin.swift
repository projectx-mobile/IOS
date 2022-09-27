//
//  ViewController.swift
//  Project X
//
//  Created by anduser on 30.08.2022.
//

import UIKit

final class WelcomScreenLogin: UIViewController {
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let createLabel = UILabel()
    private let buttonLoginGoogle = CustomLoginButton()
    private let buttonLoginApple = CustomLoginButton()
    private let buttonLoginMail = CustomLoginButton()
    private let createButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
    }
}

extension WelcomScreenLogin {
    func setupUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .primaryMidnight
        titleLabel.font = UIFont(name: "NexaDemo-Bold", size: 32)
        titleLabel.text = "Войти"
        view.addSubview(titleLabel)
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textColor = UIColor(red: 0.424, green: 0.431, blue: 0.517, alpha: 1)
        subTitleLabel.font = UIFont(name: "Roboto-Regular", size: 14)
        subTitleLabel.text = "Выбери способ доступа в свой аккаунт."
        view.addSubview(subTitleLabel)
        
        let attributedString = NSMutableAttributedString(string: "Впервые в Трекере Заданий? ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.primaryMidnight])
        let underlineString = NSAttributedString(string: "Создать аккаунт.", attributes: [NSAttributedString.Key.underlineStyle: 1, NSAttributedString.Key.foregroundColor : UIColor.primaryJuicyGrape])
        attributedString.append(underlineString)
        createLabel.translatesAutoresizingMaskIntoConstraints = false
        createLabel.font = UIFont(name: "Roboto-Medium", size: 14)
        createLabel.attributedText = attributedString
        createLabel.textAlignment = .center
        view.addSubview(createLabel)
        
        view.addSubview(buttonLoginGoogle)
        buttonLoginGoogle.configurate(with: CustomLoginButtonViewModel(textLabel: "Войти с Google",
                                                                       imageView: "googleIcon",
                                                                       backgroundColor: .primaryWhiteSnow,
                                                                       tintColor: .primaryMidnight))
        view.addSubview(buttonLoginApple)
        buttonLoginApple.configurate(with: CustomLoginButtonViewModel(textLabel: "Войти с Apple",
                                                                      imageView: "appleIcon",
                                                                      backgroundColor: .primaryPureWhite,
                                                                      tintColor: .primaryMidnight))
        view.addSubview(buttonLoginMail)
        buttonLoginMail.configurate(with: CustomLoginButtonViewModel(textLabel: "Войти по email",
                                                                     imageView: "emailIcon",
                                                                     backgroundColor: .primaryJuicyGrape,
                                                                     tintColor: .primaryPureWhite))
    }
        //MARK: - NSLayoutConstraint
    func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            createLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            createLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            createLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonLoginGoogle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonLoginGoogle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonLoginGoogle.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 48),
            buttonLoginGoogle.heightAnchor.constraint(equalToConstant: 48),
            
            buttonLoginApple.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonLoginApple.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonLoginApple.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 112),
            buttonLoginApple.heightAnchor.constraint(equalToConstant: 48),
            
            buttonLoginMail.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonLoginMail.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonLoginMail.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 216),
            buttonLoginMail.heightAnchor.constraint(equalToConstant: 48),
            
            createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            createButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            createButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            createButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}


