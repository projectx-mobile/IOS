//
//  UserRolesConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
import UIKit
//final class UserRolesConfigurator {
//   static func userRoleBuild() -> UserRolesVC {
//        let rootVC = UserRolesVC()
//        let router = UserRolesRouter()
//        let interactor = UserRolesInteractor()
//        let presenter = UserRolesPresenter(router: router, interactor: interactor)
//        rootVC.presenter = presenter
//        router.viewController = rootVC
//        interactor.presenter = presenter
//        return rootVC
//    }
//}

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
//    func configure(with viewController: UserRolesViewController) {
//        let presenter = UserRolesPresenter(view: viewController as UserRolesViewControllerInputProtocol)
//        let interactor = UserRolesInteractor(presenter: presenter)
//        let router = UserRolesRouter(viewController: viewController)
//        viewController.presenter = presenter
//        presenter.interactor = interactor
//        presenter.router = router
//        router.navigationController = navigationController
//    }

