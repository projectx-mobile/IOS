//
//  CustomizeProfileConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
//MARK: Configurator protocol
protocol CustomizeProfileConfiguratorInputProtocol {
    func configure(with viewController: CustomizeProfileVC)
}
//MARK: Configurator class
final class CustomizeProfileConfigurator: CustomizeProfileConfiguratorInputProtocol {
    func configure(with viewController: CustomizeProfileVC) {
        let presenter = CustomizeProfilePresenter(view: viewController as CustomizeProfileVCInputProtocol)
        let interactor = CustomizeProfileInteractor(presenter: presenter)
        let router = CustomizeProfileRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
