//
//  AddNewUserPresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Presenter class
final class AddNewUserPresenter: AddNewUserVCOutputProtocol {
    unowned let view: AddNewUserVCInputProtocol
    var interactor: AddNewUserInteractorInputProtocol!
    var router: AddNewUserRouterProtocol!
    required init(view: AddNewUserVCInputProtocol) {
        self.view = view
    }
}
extension AddNewUserPresenter: AddNewUserInteractorOutputProtocol {
}
