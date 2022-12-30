//
//  InviteUserByEmailPresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 22.12.22.
//

import UIKit

final class EmailUserInvitePresenter: EmailUserInviteVcOutputProtocol {
    unowned let view: EmailUserInviteVcInputProtocol
    var interactor: EmailUserInviteInteractorInputProtocol?
    var router: EmailUserInviteRouterProtocol?
    required init(view: EmailUserInviteVcInputProtocol) {
        self.view = view
    }
    func toRouter() {
        router?.popToProfileVc()
    }
}
extension EmailUserInvitePresenter: EmailUserInviteInteractorOutputProtocol {
}
