//
//  LoginWithMailScreen.swift
//  Project X
//
//  Created by Dmitriy Eni on 30.09.2022.
//

import UIKit

final class LoginWithMailScreen: UIViewController {
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let inputMailField = UITextField()
    private let inputPasswordField = UITextField()
    private let continueButton: UIButton = {
        let button = PrimaryButton(text: "Продолжить", fillColor: .secondarylavanderGrey, tintColor: .primaryPureWhite, borderColor: .secondaryDuskGrey)
        button.isHighlighted = true
        button.addTarget(self, action: #selector(continueButtonDidTap), for: .touchUpInside)
        return button
    }()
    private let helpLabel = UILabel()
    private let helpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
    }
}

private extension LoginWithMailScreen {
    func setupUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .primaryMidnight
        titleLabel.font = .nexaDemoBold32()
        titleLabel.text = "Войти"
        view.addSubview(titleLabel)
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textColor = .secondaryDuskGrey
        subTitleLabel.font = .robotoRegular14()
        subTitleLabel.text = "Введи свои данные для доступа в аккаунт."
        view.addSubview(subTitleLabel)
        
        inputMailField.translatesAutoresizingMaskIntoConstraints = false
        inputMailField.layer.cornerRadius = 8
        inputMailField.layer.borderWidth = 1.4
        inputMailField.layer.borderColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        view.addSubview(inputMailField)
        
        inputPasswordField.translatesAutoresizingMaskIntoConstraints = false
        inputPasswordField.layer.cornerRadius = 8
        inputPasswordField.layer.borderWidth = 1.4
        inputPasswordField.layer.borderColor = UIColor(red: 0.094, green: 0.098, blue: 0.145, alpha: 1).cgColor
        inputPasswordField.backgroundColor = .secondaryDuskGrey
        view.addSubview(inputPasswordField)
        
        view.addSubview(continueButton)
        
        let attributedString = NSMutableAttributedString(string: "Не помнишь пароль? ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.primaryMidnight])
        let underlineString = NSAttributedString(string: "Восстановить доступ.", attributes: [NSAttributedString.Key.underlineStyle: 1, NSAttributedString.Key.foregroundColor : UIColor.primaryJuicyGrape])
        attributedString.append(underlineString)
        helpLabel.translatesAutoresizingMaskIntoConstraints = false
        helpLabel.font = .robotoMedium14()
        helpLabel.attributedText = attributedString
        helpLabel.textAlignment = .center
        view.addSubview(helpLabel)
        
        view.addSubview(helpButton)
        helpButton.addTarget(self, action: #selector(helpButtonDidTap), for: .touchUpInside)
        
        view.backgroundColor = .primaryWhiteSnow
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            inputMailField.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 48),
            inputMailField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            inputMailField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            inputMailField.heightAnchor.constraint(equalToConstant: 56),
            
            inputPasswordField.topAnchor.constraint(equalTo: inputMailField.bottomAnchor, constant: 8),
            inputPasswordField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            inputPasswordField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            inputPasswordField.heightAnchor.constraint(equalToConstant: 56),
            
            continueButton.topAnchor.constraint(equalTo: inputPasswordField.bottomAnchor, constant: 48),
            continueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 56),

            helpLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            helpLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            helpLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            helpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            helpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            helpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            helpButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    // MARK: - TargetFunction
    @objc private func continueButtonDidTap() {
        // вызов проверки и экрана родительского профиля
    }

    @objc private func helpButtonDidTap() {
        // вызов экрана восстановления аккаунта
    }
}
