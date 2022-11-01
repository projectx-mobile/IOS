//
//  LoginWithGAScreen.swift
//  Project X
//
//  Created by Alina on 27.10.22.
//

import UIKit

final class LoginWithGAScreenViewController: UIViewController {
    
    var presenter: LoginWithGAScreenViewOutputProtocol!
    private let configurator: LoginWhithGAScreenConfiguratorInputProtocol = LoginWithGAScreenConfigurator()
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let createLabel = UILabel()
    private let createButton = UIButton()
    private let buttonLoginGoogle = LoginButton()
    private let buttonLoginApple = LoginButton()
    private let buttonLoginMail = LoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
    }
}

// MARK: - Private extension
private extension LoginWithGAScreenViewController {
    func setupUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .primaryMidnight
        titleLabel.font = .nexaDemoBold32()
        titleLabel.text = "Войти"
        view.addSubview(titleLabel)
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textColor = .duskGrey
        subTitleLabel.font = .robotoRegular14()
        subTitleLabel.text = "Выбери способ доступа в свой аккаунт."
        view.addSubview(subTitleLabel)
        
        let attributedString = NSMutableAttributedString(string: "Впервые в Трекере Заданий? ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.primaryMidnight])
        let underlineString = NSAttributedString(string: "Создать аккаунт.", attributes: [NSAttributedString.Key.underlineStyle: 1, NSAttributedString.Key.foregroundColor : UIColor.primaryJuicyGrape])
        attributedString.append(underlineString)
        createLabel.translatesAutoresizingMaskIntoConstraints = false
        createLabel.font = .robotoMedium14()
        createLabel.attributedText = attributedString
        createLabel.textAlignment = .center
        view.addSubview(createLabel)
        
        view.addSubview(createButton)
        createButton.addTarget(self, action: #selector(createButtonDidTap), for: .touchUpInside)
        
        
        view.addSubview(buttonLoginGoogle)
        buttonLoginGoogle.addTarget(self, action: #selector(buttonLoginGoogleDidTap), for: .touchUpInside)
        buttonLoginGoogle.configurate(with: CustomLoginButtonViewModel(textLabel: "Войти с Google",
                                                                       imageView: "googleIcon",
                                                                       backgroundColor: .primaryWhiteSnow,
                                                                       tintColor: .primaryMidnight))
        view.addSubview(buttonLoginApple)
        buttonLoginApple.addTarget(self, action: #selector(buttonLoginAppleDidTap), for: .touchUpInside)
        buttonLoginApple.configurate(with: CustomLoginButtonViewModel(textLabel: "Войти с Apple",
                                                                      imageView: "appleIcon",
                                                                      backgroundColor: .primaryPureWhite,
                                                                      tintColor: .primaryMidnight))
        view.addSubview(buttonLoginMail)
        buttonLoginMail.addTarget(self, action: #selector(buttonLoginMailDidTap), for: .touchUpInside)
        buttonLoginMail.configurate(with: CustomLoginButtonViewModel(textLabel: "Войти по email",
                                                                     imageView: "emailIcon",
                                                                     backgroundColor: .primaryJuicyGrape,
                                                                     tintColor: .primaryPureWhite))
        view.backgroundColor = .primaryWhiteSnow
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
    // MARK: - TargetFunction
    @objc private func buttonLoginGoogleDidTap() {
        //Логин через гугл аккаунт и показ домашнего экрана
    }
    
    @objc private func buttonLoginAppleDidTap() {
        //Логин через apple id и показ домашнего экрана
    }
    
    @objc private func buttonLoginMailDidTap() {
        //Логин через mail и показ экрана входа по почте
    }
    
    @objc private func createButtonDidTap() {
        // вызов экрана создания аккаунта
    }
    
    
}
// MARK: - LoginWithGAScreenViewInputProtocol
extension LoginWithGAScreenViewController: LoginWithGAScreenViewInputProtocol {
    
}
