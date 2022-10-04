//
//  ChildHomeScreenViewController.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import UIKit

final class ChildHomeScreenViewController: UIViewController {
    
    var presenter: ChildHomeScreenViewOutputProtocol!
    private let configurator: ChildHomeScreenConfiguratorInputProtocol = ChildHomeScreenConfigurator()
    
    private let titleLabel = TitleLabel(text: "Задачи")
    private let activeTasksLabel = SecondaryLabel(text: "Активных на сегодня (0)")
    private let notificationView = NotificationView()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryJuicyGrape
        view.layer.cornerRadius = LayoutConstants.cornerRadius10
        view.layer.borderWidth = LayoutConstants.borderWidth
        view.layer.borderColor = UIColor.primaryMidnight.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var numberOfNotifications = 0
    private var textOfNotification = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryWhiteSnow
        setupViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        checkNumberOfNotifications()
    }
}

//MARK: - Private extension
private extension ChildHomeScreenViewController {
    
    func setupViews() {
        view.addSubview(backgroundView)
        backgroundView.transform = backgroundView.transform.rotated(by: CGFloat(-0.05))
        view.addSubview(titleLabel)
        view.addSubview(activeTasksLabel)
        view.addSubview(notificationView)
    }
    
    func setupNavigationBar() {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            navBarAppearance.backgroundColor = .clear
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    func checkNumberOfNotifications() {
        presenter.getNumberOfNotifications()
        if numberOfNotifications == 0 {
            notificationView.noNotificationsSetup()
            backgroundView.isHidden = true
        } else if numberOfNotifications == 1{
            notificationView.createCustomView([.topLeft, .topRight, .bottomRight], radius: LayoutConstants.cornerRadius10, borderColor: .primaryMidnight, borderWidth: LayoutConstants.borderWidth, fillColor: .notifications)
            backgroundView.isHidden = true
            presenter.getTextOfNotification()
            notificationView.configureWithText(text: textOfNotification)
        } else {
            notificationView.createCustomView([.topLeft, .topRight, .bottomRight], radius: LayoutConstants.cornerRadius10, borderColor: .primaryMidnight, borderWidth: LayoutConstants.borderWidth, fillColor: .notifications)
            backgroundView.isHidden = false
            presenter.getTextOfNotification()
            notificationView.configureWithText(text: textOfNotification)
        }
    }
    
    func setupBackgroundView() {
        
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutConstants.inset76),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16)
        ])
        
        NSLayoutConstraint.activate([
            activeTasksLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutConstants.inset8),
            activeTasksLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            activeTasksLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16)
        ])
        
        NSLayoutConstraint.activate([
            notificationView.topAnchor.constraint(equalTo: activeTasksLabel.bottomAnchor, constant: LayoutConstants.inset40),
            notificationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: LayoutConstants.inset16),
            notificationView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -LayoutConstants.inset16),
            notificationView.heightAnchor.constraint(equalToConstant: LayoutConstants.height64)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor, constant: -LayoutConstants.inset14),
            backgroundView.widthAnchor.constraint(equalTo: notificationView.widthAnchor, constant: -LayoutConstants.inset32),
            backgroundView.heightAnchor.constraint(equalToConstant: LayoutConstants.height60)
        ])
        
    }
}

//MARK: - ChildHomeScreenViewInputProtocol
extension ChildHomeScreenViewController: ChildHomeScreenViewInputProtocol {
    func receiveNumberOfNotifications(number: Int) {
        numberOfNotifications = number
    }
    
    func receiveTextOfNotification(text: String) {
        textOfNotification = text
    }
}
