//
//  InviteByEmailConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 22.12.22.
//

import UIKit

protocol EmailUserInviteConfiguratorInputProtocol {
    func configure(with viewController: EmailUserInviteVc)
}
final class EmailUserInviteConfigurator: EmailUserInviteConfiguratorInputProtocol {
    func configure(with viewController: EmailUserInviteVc) {
        let presenter = EmailUserInvitePresenter(view: viewController as EmailUserInviteVcInputProtocol)
        let interactor = EmailUserInviteInteractor(presenter: presenter)
        let router = EmailUserInviteRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
