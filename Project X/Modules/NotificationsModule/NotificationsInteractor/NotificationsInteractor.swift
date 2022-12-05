//
//  NotificationsInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: Interactor class
final class NotificationsInteractor: NotificationsInteractorInputProtocol {
    unowned let presenter: NotificationsInteractorOutputProtocol
    required init(presenter: NotificationsInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
