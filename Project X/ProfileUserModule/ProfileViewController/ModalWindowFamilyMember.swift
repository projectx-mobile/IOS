//
//  FamilyMemberProfile.swift
//  Project X
//
//  Created by Alinser Shchurko on 11.11.22.
//

import UIKit

final class ModalWindowFamilyMemberVC: UIViewController {
    var isParent: Bool = true
    var familyMember: FamilysMember? = FamilysMember(name: "")
    weak var profileDelegate: ProfileViewControllerInputProtocol?
    // MARK: Avatar button
    private lazy var avatar: UIButton = {
        let avatar = UIButton()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.layer.borderWidth = 1.0
        avatar.setImage(familyMember?.avatar, for: .normal)
        avatar.setTitle(familyMember?.name.first?.uppercased(), for: .normal)
        avatar.backgroundColor = UIColor(red: 208/255, green: 192/255, blue: 245/255, alpha: 1)
        avatar.frame.size = CGSize(width: LayoutConstants.width72, height: LayoutConstants.height72)
        avatar.layer.borderColor = UIColor.primaryMidnight.cgColor
        avatar.titleLabel?.font = UIFont.nexaDemoBold24()
        avatar.setTitleColor( .primaryMidnight, for: .normal)
        avatar.titleLabel?.textAlignment = .center
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        return avatar
    }()
    // MARK: UserName
    private lazy var userName: SubtitleLabel = {
        let label = SubtitleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = familyMember?.name
        label.textAlignment = .center
        label.textColor = .primaryMidnight
        return label
    }()
    // MARK: Alert
    private var alertView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 0.8).cgColor
        view.layer.cornerRadius = 14
        return view
    }()
    // MARK: Close button for alert
    private let closeAlertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "closeAlertWindow"), for: .normal)
        button.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()
    @objc private func closeViewController() {
        self.dismiss(animated: true)
    }
    // MARK: Delete profile button
    private lazy var deleteUserButton: UIButton = {
        let button = PrimaryButton(text: "Удалить профиль", fillColor: .primaryWhiteSnow, tintColor: .primaryMidnight, borderColor: .primaryMidnight)
        isParent ? (button.isHidden = false) : (button.isHidden = true)
        button.titleLabel?.font = UIFont.robotoMedium16()
        button.setImage(UIImage(named: "deleteUserFigma"), for: .normal)
        button.imageView?.trailingAnchor.constraint(equalTo: button.titleLabel?.leadingAnchor ?? button.leadingAnchor, constant: -LayoutConstants.inset10).isActive = true
        button.addTarget(self, action: #selector(deleteFamilyMember), for: .touchUpInside)
        return button
    }()
    // delete family member
    @objc private func deleteFamilyMember() {
        let alert = UIAlertController(title: "Ты уверен(а), что хочешь удалить этот профиль?", message: "Это действие нельзя отменить.", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in alert.dismiss(animated: true) })
        let delete = UIAlertAction(title: "Удалить", style: .default) { [ weak self ] _ in
            guard let self = self else { return }
            guard let familyMember = self.familyMember else { return }
            self.profileDelegate?.deleteFamilyMember(familyMember)
            self.closeViewController()
        }
        alert.addAction(delete)
        alert.addAction(cancelButton)
        present(alert, animated: true)
    }
    // MARK: ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        addView()
        constraints()
    }
    // MARK: Add all view to disp
    private func addView() {
        view.addSubview(alertView)
        alertView.addSubview(avatar)
        alertView.addSubview(userName)
        alertView.addSubview(closeAlertButton)
        alertView.addSubview(deleteUserButton)
    }
    // MARK: Constraints
    private func constraints() {
        NSLayoutConstraint.activate([
            // Alert constraints
            alertView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.inset48),
            alertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutConstants.inset48),
            // avatar
            avatar.topAnchor.constraint(equalTo: alertView.topAnchor, constant: LayoutConstants.inset24),
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.widthAnchor.constraint(equalToConstant: LayoutConstants.width72),
            avatar.heightAnchor.constraint(equalToConstant: LayoutConstants.height72),
            // userName
            userName.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: LayoutConstants.inset24),
            userName.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: LayoutConstants.inset8),
            userName.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -LayoutConstants.inset8),
            // close button
            closeAlertButton.topAnchor.constraint(equalTo: alertView.topAnchor, constant: LayoutConstants.inset18),
            closeAlertButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -LayoutConstants.inset18),
            closeAlertButton.widthAnchor.constraint(equalToConstant: LayoutConstants.width15),
            closeAlertButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height15)
        ])
        // For Parent user
        if isParent == true {
            NSLayoutConstraint.activate([
                deleteUserButton.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: LayoutConstants.inset40),
                deleteUserButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: LayoutConstants.inset42),
                deleteUserButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -LayoutConstants.inset42),
                deleteUserButton.heightAnchor.constraint(equalToConstant: LayoutConstants.height48),
                alertView.bottomAnchor.constraint(equalTo: deleteUserButton.bottomAnchor, constant: LayoutConstants.inset24)
            ])
            // if !isParent change hard height
        } else {
            alertView.heightAnchor.constraint(equalToConstant: LayoutConstants.height160).isActive = true
        }
    }
}
