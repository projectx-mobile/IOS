//
//  NotificationsRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
import UIKit
// MARK: Router protocol
protocol NotificationsRouterProtocol {
    init(viewController: NotificationsVC)
}
// MARK: Router Class
final class NotificationsRouter: NotificationsRouterProtocol {
    unowned let viewController: NotificationsVC
    weak var navigationController: UINavigationController?
    required init(viewController: NotificationsVC) {
        self.viewController = viewController
    }
}
