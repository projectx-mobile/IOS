//
//  NotificationsConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: Configurator protocol
protocol NotificationsConfiguratorInputProtocol {
    func configure(with viewController: NotificationsVC)
}
// MARK: Configurator class
final class NotificationsConfigurator: NotificationsConfiguratorInputProtocol {
    func configure(with viewController: NotificationsVC) {
        let presenter = NotificationsPresenter(view: viewController as NotificationsVCInputProtocol)
        let interactor = NotificationsInteractor(presenter: presenter)
        let router = NotificationsRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
