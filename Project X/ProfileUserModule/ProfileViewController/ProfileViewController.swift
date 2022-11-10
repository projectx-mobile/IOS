//
//  ProfileViewController.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
import UIKit
// MARK: Profile class
final class ProfileViewController: UIViewController {
    var presenter: ProfileViewControllerOutputProtocol?
    private var isParent: Bool = false
    // MARK: Custom Navigation Bar
    private var customNavigationBar: UINavigationBar = UINavigationBar()
    // MARK: Basic scrollView
    private lazy var baseScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .primaryWhiteSnow
        scrollView.frame = view.bounds
        scrollView.contentSize.width = UIScreen.main.bounds.width
        scrollView.delegate = self
        return scrollView
    }()
    // MARK: Basic container view
    private var conteinerView = UIView()
    // MARK: Сonstant for start position scrollView. Used in delegate scrollview method
    private lazy var contentOffset = self.baseScrollView.contentOffset.y
    // MARK: Labels
    private let avatarIcon = AvatarIcon(userName: "UserName", image: UIImage(named: "") ?? nil )
    // MARK: Collection view (Family members)
    private let collectionView = FamilyCollection()
    // MARK: Labels
    // Username Title name of user
    private let titleUsernameLabel: UILabel = {
       let label = TitleLabel(text: "UserName")
        label.numberOfLines = 0
        return label
    }()
    // Set profile label
    private let setProfileLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Настройки профиля"
        label.textAlignment = .left
        label.textColor = .primaryMidnight
        label.font = UIFont.nexaDemoBold16()
        return label
    }()
    // MARK: Buttons
    // Edit profile button
    private lazy var editProfileButton: UIButton = {
        let button = EditProfileButton()
        button.addTarget(self, action: #selector(transitionToNewVc), for: .touchUpInside)
        return button
    }()
    // MARK: Group buttons
    private lazy var emailButton: UIButton = {
        let button = ProfileButton(leftIcon: UIImage(named: "emailFigma"), title: "Email")
        button.addTarget(self, action: #selector(transitionToNewVc(sender: )), for: .touchUpInside)
        return button
    }()
    private lazy var passwordButton: ProfileButton = {
        let button = ProfileButton(leftIcon: UIImage(named: "keyFigma"), title: "Пароль")
        button.addTarget(self, action: #selector(transitionToNewVc(sender: )), for: .touchUpInside)
        return button
    }()
    private lazy var parentButton: ProfileButton = {
        let parentButton = ProfileButton(leftIcon: UIImage(named: "personFigma"), title: "Родитель")
        let childrenButton = ProfileButton(leftIcon: UIImage(named: "personFigma"), title: "Ребенок")
        parentButton.addTarget(self, action: #selector(transitionToNewVc), for: .touchUpInside)
        parentButton.isEnabled = true
        childrenButton.isEnabled = false
       return isParent ? parentButton : childrenButton
    }()
    private lazy var notificationButton: UIButton = {
        let button = ProfileButton(leftIcon: UIImage(named: "bellFigma"), title: "Уведомления")
        button.addTarget(self, action: #selector(transitionToNewVc(sender: )), for: .touchUpInside)
        return button
    }()
    private lazy var languageButton: UIButton = {
        let button = ProfileButton(leftIcon: UIImage(named: "changeLunguage"), title: "Выбрать язык")
        button.addTarget(self, action: #selector(transitionToNewVc(sender: )), for: .touchUpInside)
        return button
    }()
    private lazy var supportButton: UIButton = {
        let button = ProfileButton(leftIcon: UIImage(named: "supportFigma"), title: "Поддержка")
        button.addTarget(self, action: #selector(transitionToNewVc(sender: )), for: .touchUpInside)
        return button
    }()
    private lazy var exitButton: UIButton = {
         let button = PrimaryButton(text: "Выйти", fillColor: .primaryWhiteSnow, tintColor: .primaryMidnight, borderColor: .primaryMidnight)
        button.titleLabel?.font = UIFont.robotoBold16()
        button.setImage(UIImage(named: "quitButtonFigma"), for: .normal)
        button.imageView?.trailingAnchor.constraint(equalTo: button.titleLabel?.leadingAnchor ?? button.leadingAnchor, constant: -12.5).isActive = true
        button.addTarget(self, action: #selector(transitionToNewVc(sender: )), for: .touchUpInside)
        return button
    }()
   // MARK: StackView
   private lazy var firstFourButtonsStack: UIStackView = {
       let view = UIStackView(arrangedSubviews: [emailButton, passwordButton, parentButton, notificationButton ])
       view.translatesAutoresizingMaskIntoConstraints = false
       view.axis = .vertical
       view.spacing = 8
       var widthDispConstraints = 32.0
       view.frame.size = CGSize(width: UIScreen.main.bounds.width - widthDispConstraints, height: max(emailButton.frame.size.height, passwordButton.frame.size.height, parentButton.frame.size.height, notificationButton.frame.size.height))
       return view
   }()
    // MARK: Buttons language and notification
    private lazy var lastTwoButtonsStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [languageButton, supportButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        var widthDispConstraints = 32.0
        view.frame.size = CGSize(width: UIScreen.main.bounds.width - widthDispConstraints, height: max(languageButton.frame.height, supportButton.frame.height))
        return view
    }()
    // MARK: navigationBarLabels
    // User namelabel (NavBar)
    private let navBarUsernameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username"
        label.textColor = .primaryMidnight
        label.textAlignment = .center
        label.font = UIFont.nexaDemoBold16()
        return label
    }()
    // Constant "Set profile" label
    private let navBarSetProfileLabel: UILabel = {
    let label = UILabel()
     label.translatesAutoresizingMaskIntoConstraints = false
     label.text = "Настройки профиля"
     label.textColor = .duskGrey
     label.textAlignment = .center
     label.font = UIFont.robotoRegular13()
     return label
 }()
    // MARK: My Family label
    private let myFamilyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Моя семья"
        label.font = .nexaDemoBold16()
        label.textColor = .primaryMidnight
        return label
    }()
    // MARK: Add new user button
    private lazy var addNewUser: UIButton = {
        let button = AvatarIcon(userName: "", image: UIImage())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = isParent
        button.setImage(UIImage(named: "addUserFigma"), for: .normal)
        button.setImage(UIImage(named: "AddUserNoEnabledFigma"), for: .disabled)
        button.isEnabled ? (button.layer.borderColor = UIColor.primaryMidnight.cgColor) : (button.layer.borderColor = UIColor.clear.cgColor)
        button.addTarget(self, action: #selector(transitionToNewVc(sender: )), for: .touchUpInside)
        return button
    }()
    // MARK: title for add new user button
    private let titleAddNewUser: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добавить"
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Medium", size: 11)
        label.textColor = .duskGrey
        return label
    }()
    // MARK: Separator label
    private let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 192/255, green: 193/255, blue: 210/255, alpha: 1) // lavander color
        return view
    }()
    // MARK: DidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        conteinerView.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: (baseScrollView.frame.height + LayoutConstants.height375))
        //customNavigationBar.isHidden = true
    }
    // MARK: When user return from new display i hide system navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        //customNavigationBar.isHidden = true
    }
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setCustomNavBarView()
        constraints()
       }
    // MARK: Set custom NavBar
    private func setCustomNavBarView() {
        self.customNavigationBar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 132)
        self.customNavigationBar.backgroundColor = UIColor.primaryWhiteSnow.withAlphaComponent(0.95)
        self.customNavigationBar.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        self.customNavigationBar.layer.borderWidth = 1.0
        self.customNavigationBar.isHidden = true
            }
    // MARK: Add view on screen
    private func addView() {
        self.view.addSubview(baseScrollView)
        self.baseScrollView.addSubview(conteinerView)
        self.view.addSubview(customNavigationBar)
        self.conteinerView.addSubview(avatarIcon)
        self.conteinerView.addSubview(titleUsernameLabel)
        self.conteinerView.addSubview(editProfileButton)
        self.conteinerView.addSubview(setProfileLabel)
        self.conteinerView.addSubview(firstFourButtonsStack)
        self.conteinerView.addSubview(myFamilyLabel)
        self.conteinerView.addSubview(addNewUser)
        self.conteinerView.addSubview(titleAddNewUser)
        self.conteinerView.addSubview(collectionView)
        self.conteinerView.addSubview(separatorView)
        self.conteinerView.addSubview(lastTwoButtonsStack)
        self.conteinerView.addSubview(exitButton)
        self.customNavigationBar.addSubview(navBarUsernameLabel)
        self.customNavigationBar.addSubview(navBarSetProfileLabel)
    }
    // MARK: All Constraints
    private func constraints() {
        NSLayoutConstraint.activate([
            // AvatarIcon
            avatarIcon.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: LayoutConstants.inset52),
            avatarIcon.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: LayoutConstants.inset16),
            avatarIcon.widthAnchor.constraint(equalToConstant: LayoutConstants.width56),
            avatarIcon.heightAnchor.constraint(equalToConstant: LayoutConstants.height56),
             // Title Username
            titleUsernameLabel.leadingAnchor.constraint(equalTo: avatarIcon.trailingAnchor, constant: LayoutConstants.inset8),
            titleUsernameLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -LayoutConstants.inset40),
            titleUsernameLabel.centerYAnchor.constraint(equalTo: avatarIcon.centerYAnchor),
            // Edit profile button Username
            editProfileButton.widthAnchor.constraint(equalToConstant: LayoutConstants.width24),
            editProfileButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height24),
            editProfileButton.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -LayoutConstants.inset16),
            editProfileButton.centerYAnchor.constraint(equalTo: avatarIcon.centerYAnchor),
            // Navigation bar user name
            navBarUsernameLabel.topAnchor.constraint(equalTo: customNavigationBar.topAnchor, constant: LayoutConstants.inset46),
            navBarUsernameLabel.bottomAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: LayoutConstants.inset22),
            navBarUsernameLabel.leadingAnchor.constraint(equalTo: customNavigationBar.leadingAnchor, constant: LayoutConstants.inset64),
            navBarUsernameLabel.trailingAnchor.constraint(equalTo: customNavigationBar.trailingAnchor, constant: -LayoutConstants.inset64),
            // Navigation second static label
            navBarSetProfileLabel.bottomAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            navBarSetProfileLabel.leadingAnchor.constraint(equalTo: customNavigationBar.leadingAnchor, constant: LayoutConstants.inset64),
            navBarSetProfileLabel.trailingAnchor.constraint(equalTo: customNavigationBar.trailingAnchor, constant: -LayoutConstants.inset64),
            // "Profile settings" label
            setProfileLabel.topAnchor.constraint(equalTo: titleUsernameLabel.bottomAnchor, constant: LayoutConstants.inset34),
            setProfileLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: LayoutConstants.inset16),
            // StackView buttons (Email, Password, Roles, Notifications)
            firstFourButtonsStack.topAnchor.constraint(equalTo: setProfileLabel.bottomAnchor, constant: LayoutConstants.inset16),
            firstFourButtonsStack.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: LayoutConstants.inset16),
            firstFourButtonsStack.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -LayoutConstants.inset16),
            // "My family" label
            myFamilyLabel.topAnchor.constraint(equalTo: firstFourButtonsStack.bottomAnchor, constant: LayoutConstants.inset32),
            myFamilyLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: LayoutConstants.inset16),
            myFamilyLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -LayoutConstants.inset16),
            // Add new user button
            addNewUser.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: LayoutConstants.inset16),
            addNewUser.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor),
            // Add new user title (under button)
            titleAddNewUser.centerXAnchor.constraint(equalTo: addNewUser.centerXAnchor),
            titleAddNewUser.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            // Collection view
            collectionView.topAnchor.constraint(equalTo: myFamilyLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: addNewUser.trailingAnchor, constant: LayoutConstants.inset16),
            collectionView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -LayoutConstants.inset16),
            collectionView.heightAnchor.constraint(equalToConstant: LayoutConstants.height100),
            // Separator under collection view
            separatorView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: LayoutConstants.inset40),
            separatorView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: LayoutConstants.inset16),
            separatorView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -LayoutConstants.inset16),
            separatorView.heightAnchor.constraint(equalToConstant: LayoutConstants.height1),
            // Second stackView (Language and support buttons)
            lastTwoButtonsStack.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: LayoutConstants.inset32),
            lastTwoButtonsStack.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: LayoutConstants.inset16),
            lastTwoButtonsStack.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -LayoutConstants.inset16),
            // Exit button
            exitButton.topAnchor.constraint(equalTo: lastTwoButtonsStack.bottomAnchor, constant: LayoutConstants.inset32),
            exitButton.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: LayoutConstants.inset16),
            exitButton.widthAnchor.constraint(equalToConstant: LayoutConstants.width112),
            exitButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height48),
            // Scroll view (that anchor take height for scroll)
            baseScrollView.bottomAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: LayoutConstants.inset80),
        ])
    }
}
// MARK: Extension for show/hide navigation bar
extension ProfileViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let tabBarHeight = 86.0
        if (self.contentOffset + tabBarHeight) < scrollView.contentOffset.y {
            customNavigationBar.isHidden = false
        } else {
            customNavigationBar.isHidden = true
        }
    }
}
// MARK: To presenter for take router info for open needed screen
extension ProfileViewController {
    @objc func transitionToNewVc(sender: UIButton) {
        switch sender {
        case editProfileButton:
            presenter?.openNewVC(.customize)
        case emailButton:
            presenter?.openNewVC(.emailSetting)
        case passwordButton:
            presenter?.openNewVC(.passwordSetting)
        case parentButton:
            presenter?.openNewVC(.userRoles)
        case notificationButton:
            presenter?.openNewVC(.notifications)
        case addNewUser:
            presenter?.openNewVC(.addNewUser)
        case languageButton:
            presenter?.openNewVC(.language)
        case supportButton:
            presenter?.openNewVC(.support)
        case exitButton:
            presenter?.openNewVC(.exit)
        default: break
        }
    }
}
// MARK: Input VC protocol
extension ProfileViewController: ProfileViewControllerInputProtocol {
    }
