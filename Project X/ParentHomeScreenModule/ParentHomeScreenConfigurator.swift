//
//  ParentHomeScreenConfigurator.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//


import UIKit

protocol ParentHomeScreenConfiguratorInputProtocol {
    func configure(with viewController: ParentHomeScreenViewController, with navigationController: UINavigationController)
}

final class ParentHomeScreenConfigurator: ParentHomeScreenConfiguratorInputProtocol {
    func configure(with viewController: ParentHomeScreenViewController, with navigationController: UINavigationController) {
        let presenter = ParentHomeScreenPresenter(view: viewController as ParentHomeScreenViewInputProtocol)
        let interactor = ParentHomeScreenInteractor(presenter: presenter)
        let router = ParentHomeScreenRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        router.navigationController = navigationController
    }
}
