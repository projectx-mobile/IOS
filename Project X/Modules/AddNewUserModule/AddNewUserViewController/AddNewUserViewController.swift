//
//  AddNewUserViewController.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//
import UIKit
// MARK: ADD NEW USER DISPLAY
final class AddNewUserVC: UIViewController {
    // MARK: Constants
    var presenter: AddNewUserVCOutputProtocol!
    // MARK: Labels:
    private let newUserLabel = TitleLabel(text: "Новый пользователь")
    private let secondaryLabel: UILabel = {
        let label = SecondaryLabel(text: "Выбери способ, с помощью которого мы\nпригласим нового пользователя")
        label.numberOfLines = 0
        return label
    }()
    // MARK: Buttons
    private let inviteByEmailButton = ProfileButton(leftIcon: UIImage(named: "emailFigma"), title: "Пригласить по email")
    private let inviteByLinkButton = ProfileButton(leftIcon: UIImage(named: "linkFigma"), title: "Поделиться ссылкой")
    private let familyIdButton = ProfileButton(leftIcon: UIImage(named: "keyFigma"), title: "Поделиться ссылкой")
    // MARK: View
    private lazy var stackViewButton: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [inviteByEmailButton, inviteByLinkButton, familyIdButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = LayoutConstants.inset16
        return stackView
    }()
    // MARK: System methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setSuperView()
        setNavigationBar()
        addView()
        constraints()
    }
}
// MARK: Custom funcs
private extension AddNewUserVC {
    func setSuperView() {
        view.backgroundColor = .primaryWhiteSnow
    }
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "leftChevronFigma")?.withTintColor(.primaryMidnight, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "leftChevronFigma")?.withTintColor(.primaryMidnight, renderingMode: .alwaysOriginal)
    }
    func addView() {
        view.addSubview(newUserLabel)
        view.addSubview(secondaryLabel)
        view.addSubview(stackViewButton)
        
    }
}
// MARK: Constraints
private extension AddNewUserVC {
    func constraints() {
        NSLayoutConstraint.activate([
            // Name user label
            newUserLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  LayoutConstants.inset16),
            newUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  LayoutConstants.inset16),
            newUserLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -LayoutConstants.inset16),
           // Secondary header label
            secondaryLabel.topAnchor.constraint(equalTo: newUserLabel.bottomAnchor, constant: LayoutConstants.inset8),
            secondaryLabel.widthAnchor.constraint(equalTo: newUserLabel.widthAnchor),
            secondaryLabel.centerXAnchor.constraint(equalTo: newUserLabel.centerXAnchor),
            // Stack view button
            stackViewButton.topAnchor.constraint(equalTo: secondaryLabel.bottomAnchor, constant: LayoutConstants.inset48),
            stackViewButton.widthAnchor.constraint(equalTo: secondaryLabel.widthAnchor),
            stackViewButton.centerXAnchor.constraint(equalTo: secondaryLabel.centerXAnchor)
        ])
    }
}
extension AddNewUserVC: AddNewUserVCInputProtocol {
}
