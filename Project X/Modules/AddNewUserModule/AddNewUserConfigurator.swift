//
//  AddNewUserConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Configurator protocol
protocol AddNewUserConfiguratorInputProtocol {
    func configure(with viewController: AddNewUserVC)
}
// MARK: Configurator class
final class AddNewUserConfigurator: AddNewUserConfiguratorInputProtocol {
    func configure(with viewController: AddNewUserVC) {
        let presenter = AddNewUserPresenter(view: viewController as AddNewUserVCInputProtocol)
        let interactor = AddNewUserInteractor(presenter: presenter)
        let router = AddNewUserRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
