//
//  ProfilePresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
// MARK: Presenter Protocol
protocol ProfilePresenterProtocol: AnyObject {
}
// MARK: Presenter class
class ProfilePresenter {
    weak var view: ProfileVCProtocol?
    var router: ProfileRouterProtocol?
    var interactor: ProfileInteractorProtocol?
    init(router: ProfileRouterProtocol?, interactor: ProfileInteractorProtocol?) {
        self.router = router
        self.interactor = interactor
    }
}
extension ProfilePresenter: ProfilePresenterProtocol {
}
