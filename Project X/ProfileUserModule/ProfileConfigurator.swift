//
//  ProfileConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
import UIKit
protocol ProfileConfiguratorInputProtocol {
    func configure(with viewController: ProfileViewController, with navigationController: UINavigationController)
}
final class ProfileConfigurator: ProfileConfiguratorInputProtocol {
    func configure(with viewController: ProfileViewController, with navigationController: UINavigationController) {
        let presenter = ProfilePresenter(view: viewController as ProfileViewControllerInputProtocol)
        let interactor = ProfileInteractor(presenter: presenter)
        let router = ProfileRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        router.navigationController = navigationController
    }
}
