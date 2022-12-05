//
//  EmailSettingConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Configurator protocol
protocol EmailSettingConfiguratorInputProtocol {
    func configure(with viewController: EmailSettingVC)
}
// MARK: Configurator class
final class EmailSettingConfigurator: EmailSettingConfiguratorInputProtocol {
    func configure(with viewController: EmailSettingVC) {
        let presenter = EmailSettingPresenter(view: viewController as EmailSettingVCInputProtocol)
        let interactor = EmailSettingInteractor(presenter: presenter)
        let router = EmailSettingRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
