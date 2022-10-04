//
//  ChildHomeScreenConfigurator.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import UIKit

protocol ChildHomeScreenConfiguratorInputProtocol {
    func configure(with viewController: ChildHomeScreenViewController, with navigationController: UINavigationController)
}

final class ChildHomeScreenConfigurator: ChildHomeScreenConfiguratorInputProtocol {
    func configure(with viewController: ChildHomeScreenViewController, with navigationController: UINavigationController) {
        let presenter = ChildHomeScreenPresenter(view: viewController as ChildHomeScreenViewInputProtocol)
        let interactor = ChildHomeScreenInteractor(presenter: presenter)
        let router = ChildHomeScreenRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        router.navigationController = navigationController
    }
}
