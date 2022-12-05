//
//  LoginWithGAScreenConfigurator.swift
//  Project X
//
//  Created by Alina on 27.10.22.
//

import UIKit

protocol LoginWhithGAScreenConfiguratorInputProtocol {
    
    func configure(with viewController: LoginWithGAScreenViewController, with navigationController: UINavigationController)
     
}

final class LoginWithGAScreenConfigurator: LoginWhithGAScreenConfiguratorInputProtocol {
        func configure(with viewController: LoginWithGAScreenViewController, with navigationController: UINavigationController) {
        let presenter = LoginWithGAScreenPresenter(view: viewController as LoginWithGAScreenViewInputProtocol)
        let interactor = LoginWithGAScreenInteractor(presenter: presenter)
        let router = LoginWithGAScreenRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        router.navigationController = navigationController
    }
}






