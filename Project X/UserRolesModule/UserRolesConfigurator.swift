//
//  UserRolesConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import UIKit

protocol UserRolesConfiguratorInputProtocol {
    func configure(with viewController: UserRolesViewController)
}

final class UserRolesConfigurator: UserRolesConfiguratorInputProtocol {
    func configure(with viewController: UserRolesViewController) {
        let presenter = UserRolesPresenter(view: viewController as UserRolesViewControllerInputProtocol)
        let interactor = UserRolesInteractor(presenter: presenter)
        let router = UserRolesRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
