//
//  ParentUpdatesConfigurator.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 29.09.22.
//

import Foundation

protocol ParentUpdatesConfiguratorInputProtocol {
    func configure(with viewController: ParentUpdatesViewController)
}

final class ParentUpdatesConfigurator: ParentUpdatesConfiguratorInputProtocol {
    
    func configure(with viewController: ParentUpdatesViewController) {
        let presenter = ParentUpdatesPresenter(view: viewController as ParentUpdatesViewInputProtocol)
        let interactor = ParentUpdatesInteractor(presenter: presenter)
        let router = ParentUpdatesRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
