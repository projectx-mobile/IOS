//
//  UserRolesPresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation

//protocol UserRolesPresenterProtocol: AnyObject {
//}
//
//final class UserRolesPresenter {
//    weak var viewController: UserRolesVCProtocol?
//    var router: UserRolesRouterProtocol?
//    var interactor: UserRolesInteractorProtocol?
//    init(router: UserRolesRouterProtocol?, interactor: UserRolesInteractorProtocol?) {
//        self.router = router
//        self.interactor = interactor
//    }
//}
//
//extension UserRolesPresenter: UserRolesPresenterProtocol {
//}

final class UserRolesPresenter: UserRolesViewControllerOutputProtocol {
    unowned let view: UserRolesViewControllerInputProtocol
    var interactor: UserRolesInteractorInputProtocol!
    var router: UserRolesRouterInputProtocol!
    required init(view: UserRolesViewControllerInputProtocol) {
        self.view = view
    }
    func didTaptransitionDisp() {
        //router.
    }
}
extension UserRolesPresenter: UserRolesInteractorOutputProtocol {
}
