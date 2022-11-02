//
//  LoginWithMailScreenConfigurator.swift
//  Project X
//
//  Created by Alina on 2.11.22.
//

import UIKit

protocol LoginWhithMailScreenConfiguratorInputProtocol {
    
    func configure(with viewController: LoginWithMailScreenViewController, with navigationController: UINavigationController)
     
}

final class LoginWithMailScreenConfigurator: LoginWhithMailScreenConfiguratorInputProtocol {
        func configure(with viewController: LoginWithMailScreenViewController, with navigationController: UINavigationController) {
        let presenter = LoginWithMailScreenPresenter(view: viewController as LoginWithMailScreenViewInputProtocol)
        let interactor = LoginWithMailScreenInteractor(presenter: presenter)
        let router = LoginWithMailScreenRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        router.navigationController = navigationController
    }
}
