//
//  WelcomeConfigurator.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 8.09.22.
//

import Foundation

protocol WelcomeConfiguratorInputProtocol {
    func configure(with viewController: WelcomeViewController)
}

class WelcomeConfigurator: WelcomeConfiguratorInputProtocol {
    
    func configure(with viewController: WelcomeViewController) {
        let presenter = WelcomePresenter(view: viewController as WelcomeViewInputProtocol)
        let interactor = WelcomeInteractor(presenter: presenter)
        let router = WelcomeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
