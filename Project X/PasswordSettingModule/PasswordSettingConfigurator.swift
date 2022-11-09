//
//  PasswordUpdateConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Configurator protocol
protocol PasswordSettingConfiguratorInputProtocol {
    func configure(with viewController: PasswordSettingVC)
}
// MARK: Configurator class
final class PasswordSettingConfigurator: PasswordSettingConfiguratorInputProtocol {
    func configure(with viewController: PasswordSettingVC) {
        let presenter = PasswordSettingPresenter(view: viewController as PasswordSettingVCInputProtocol)
        let interactor = PasswordSettingInteractor(presenter: presenter)
        let router = PasswordSettingRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
