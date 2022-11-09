//
//  NotificationsPresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: Presenter class
final class NotificationsPresenter: NotificationsVCOutputProtocol {
    unowned let view: NotificationsVCInputProtocol
    var interactor: NotificationsInteractorInputProtocol!
    var router: NotificationsRouterProtocol!
    required init(view: NotificationsVCInputProtocol) {
        self.view = view
    }
}
extension NotificationsPresenter: NotificationsInteractorOutputProtocol {
}
