//
//  ProfilePresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
import UIKit
// MARK: Enum for  undesteding 
enum DisplayNames {
    case customize
    case emailSetting
    case passwordSetting
    case userRoles
    case notifications
    case addNewUser
    case language
    case support
    case exit
}
// MARK: Presenter Protocol
final class ProfilePresenter: ProfileViewControllerOutputProtocol {
    unowned let view: ProfileViewControllerInputProtocol
    var interactor: ProfileInteractorInputProtocol?
    var router: ProfileRouterInputProtocol?
    required init(view: ProfileViewControllerInputProtocol) {
        self.view = view
    }
    // MARK: Open new VC
    func openNewVC(_ display: DisplayNames) {
        switch display {
        case .customize:
            router?.openCustomizeProfile()
        case .emailSetting:
            router?.openEmailSetting()
        case .passwordSetting:
            router?.openPasswordSetting()
        case .userRoles:
            router?.openUserRolesVC()
        case .notifications:
            router?.openNotificationsVC()
        case .addNewUser:
            router?.addNewUser()
        case .language:
            router?.languageSetting()
        case .support:
            router?.support()
        case .exit:
            router?.exit()
        }
    }
}
extension ProfilePresenter: ProfileInteractorOutputProtocol {
}
