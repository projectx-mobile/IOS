//
//  WelcomeViewController.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

class WelcomeViewController: UIViewController {

    var presenter: WelcomeViewOutputProtocol!
    private let configurator: WelcomeConfiguratorInputProtocol = WelcomeConfigurator()

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
}


//MARK: - Private extension
extension WelcomeViewController {
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
        UIView.animate(withDuration: 1) {
            self.comeBackView.frame = CGRect(x: 0,
                                             y: UIScreen.main.bounds.size.height,width: self.comeBackView.frame.width ,
                                             height: self.comeBackView.frame.height)
        }
    }
    @objc private func signUpButtonTapped() {
    }

    @objc private func logInButtonTapped() {
        UIView.animate(withDuration: 1) {
            self.comeBackView.frame = CGRect(x: 0,
                                             y: (UIScreen.main.bounds.size.height - self.comeBackView.frame.height),width: self.comeBackView.frame.width,
                                             height: self.comeBackView.frame.height)
        }
    }

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
