//
//  ParentHomeScreenViewController.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import UIKit

class ParentHomeScreenViewController: UIViewController, ParentHomeScreenViewInputProtocol {
    
    var presenter: ParentHomeScreenViewOutputProtocol!
    private let configurator: ParentHomeScreenConfiguratorInputProtocol = ParentHomeScreenConfigurator()
    
    private let titleLabel = TitleLabel(text: "Задачи")
    private let activeTasksLabel = SecondaryLabel(text: "Активных на сегодня (0)")
    private let myFamilyLabel = SubtitleLabel(text: "Моя семья")
    private let inviteUsersLabel = SecondaryLabelWithIcon(text: "Пригласить пользователей")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhiteSnow
        setupViews()
        setConstraints()
    }
}

//MARK: - Private extension
extension ParentHomeScreenViewController {
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(activeTasksLabel)
        view.addSubview(myFamilyLabel)
        view.addSubview(inviteUsersLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 76),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            activeTasksLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            activeTasksLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            activeTasksLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            myFamilyLabel.topAnchor.constraint(equalTo: activeTasksLabel.bottomAnchor, constant: 29),
            myFamilyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            myFamilyLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            inviteUsersLabel.topAnchor.constraint(equalTo: myFamilyLabel.bottomAnchor, constant: 9),
            inviteUsersLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            inviteUsersLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}
