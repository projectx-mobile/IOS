//
//  ProfileConfigurator.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation

final class ProfileConfigurator {
    static func build() -> ProfileViewController {
        let interactor = ProfileInteractor()
        let router = ProfileRouter()
        let presenter = ProfilePresenter(router: router, interactor: interactor)
        let rootVC = ProfileViewController()
        rootVC.presenter = presenter
        presenter.view = rootVC
        router.profileVC = rootVC
        interactor.presenter = presenter
        return rootVC
    }
}
