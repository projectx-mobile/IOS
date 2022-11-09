//
//  ProfilePresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
import UIKit
// MARK: Presenter Protocol
final class ProfilePresenter: ProfileViewControllerOutputProtocol {
    unowned let view: ProfileViewControllerInputProtocol
    var interactor: ProfileInteractorInputProtocol!
    var router: ProfileRouterInputProtocol!
    required init(view: ProfileViewControllerInputProtocol) {
        self.view = view
    }
    func customizeProfile() {
        router.openCustomizeProfile()
    }
    func emailSetting() {
        router.openEmailSetting()
    }
    func passwordSetting() {
        router.openPasswordSetting()
    }
    func userRoles() {
        router.openUserRolesVC()
    }
    func notificationsVC() {
        router.openNotificationsVC()
    }
    func addNewUser() {
        router.addNewUser()
    }
    func languageSettings() {
        router.languageSetting()
    }
    func support() {
        router.support()
    }
    func exit() {
        router.exit()
    }
}
extension ProfilePresenter: ProfileInteractorOutputProtocol {
}
