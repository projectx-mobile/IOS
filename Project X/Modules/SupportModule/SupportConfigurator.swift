//
//  SupportConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Configurator protocol
protocol SupportConfiguratorInputProtocol {
    func configure(with viewController: SupportVC)
}
// MARK: Configurator class
final class SupportConfigurator: SupportConfiguratorInputProtocol {
    func configure(with viewController: SupportVC) {
        let presenter = SupportPresenter(view: viewController as SupportVCInputProtocol)
        let interactor = SupportInteractor(presenter: presenter)
        let router = SupportRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
