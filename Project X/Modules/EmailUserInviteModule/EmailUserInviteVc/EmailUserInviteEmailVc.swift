//
//  InviteUserByEmailVc.swift
//  Project X
//
//  Created by Alinser Shchurko on 22.12.22.
//

import UIKit
final class EmailUserInviteVc: UIViewController {
    var presenter: EmailUserInviteVcOutputProtocol?
// MARK: Labels
    private let emailInviteLabel = TitleLabel(text: "Пригласить по email")
    // MARK: Buttons
    let parentRadioButton: UIButton = {
        let button = RadioButton(text: "Родитель")
        button.addTarget(self, action: #selector(radioButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    let childRadioButton = RadioButton(text: "Ребенок")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhiteSnow
        navigationController?.navigationBar.topItem?.backButtonTitle = String()
        addView()
        constraints()
    }
}
// MARK: Actions
private extension EmailUserInviteVc {
    @objc func radioButtonAction(sender: UIButton) {
            switch sender {
            case parentRadioButton:
                parentRadioButton.isSelected = true
              //  childRadioButton.isSelected = false
            case childRadioButton:
                childRadioButton.isSelected = true
                parentRadioButton.isSelected = false
            default:
                break
            }
    }
}
// MARK: Custom methods
private extension EmailUserInviteVc {
    func addView() {
        view.addSubview(emailInviteLabel)
        view.addSubview(parentRadioButton)
    }
    
}
// MARK: Constraints
private extension EmailUserInviteVc {
    func constraints() {
        NSLayoutConstraint.activate([
            self.emailInviteLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.inset16),
            self.emailInviteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.inset16),
            self.emailInviteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutConstants.inset16),
            self.parentRadioButton.topAnchor.constraint(equalTo: emailInviteLabel.bottomAnchor, constant: LayoutConstants.inset40),
            self.parentRadioButton.leadingAnchor.constraint(equalTo: emailInviteLabel.leadingAnchor),
        ])
    }
}
extension EmailUserInviteVc: EmailUserInviteVcInputProtocol {
}
