//
//  LanguageSettingConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//
import Foundation
// MARK: Configurator protocol
protocol LanguageSettingConfiguratorInputProtocol {
    func configure(with viewController: LanguageSettingVC)
}
// MARK: Configurator class
final class LanguageSettingConfigurator: LanguageSettingConfiguratorInputProtocol {
    func configure(with viewController: LanguageSettingVC) {
        let presenter = LanguageSettingPresenter(view: viewController as LanguageSettingVCInputProtocol)
        let interactor = LanguageSettingInteractor(presenter: presenter)
        let router = LanguageSettingRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
