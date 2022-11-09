//
//  NotificationsInteractorIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: Interactor protocols
protocol NotificationsInteractorInputProtocol: AnyObject {
    init(presenter: NotificationsInteractorOutputProtocol)
}
protocol NotificationsInteractorOutputProtocol: AnyObject {
}
