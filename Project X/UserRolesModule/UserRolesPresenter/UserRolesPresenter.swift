//
//  UserRolesPresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
final class UserRolesPresenter: UserRolesViewControllerOutputProtocol {
    unowned let view: UserRolesViewControllerInputProtocol
    var interactor: UserRolesInteractorInputProtocol!
    var router: UserRolesRouterInputProtocol!
    required init(view: UserRolesViewControllerInputProtocol) {
        self.view = view
    }
}
extension UserRolesPresenter: UserRolesInteractorOutputProtocol {
}
