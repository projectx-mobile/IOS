//
//  AddNewUserPresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Presenter class
final class AddNewUserPresenter: AddNewUserVCOutputProtocol {
    func openNewVc(sender: String) {
        switch sender {
        case "Email":
            router.openEmailInvite()
        case "Link":
            router.openLinkInvite()
        case "FamilyID":
            router.inviteFamilyID()
        default: break
        }
    }
    
    unowned let view: AddNewUserVCInputProtocol
    var interactor: AddNewUserInteractorInputProtocol!
    var router: AddNewUserRouterProtocol!
    required init(view: AddNewUserVCInputProtocol) {
        self.view = view
    }
}
extension AddNewUserPresenter: AddNewUserInteractorOutputProtocol {
}
