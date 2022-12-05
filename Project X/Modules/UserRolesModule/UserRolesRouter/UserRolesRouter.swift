//
//  UserRolesRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import UIKit
protocol UserRolesRouterInputProtocol {
    init(viewController: UserRolesViewController)
    func openParentUpdatesViewController()
}

final class UserRolesRouter: UserRolesRouterInputProtocol {
    unowned let viewController: UserRolesViewController
    weak var navigationController: UINavigationController?
    required init(viewController: UserRolesViewController) {
        self.viewController = viewController
    }
    
    func openUserRolesVC() {

    }
    func openParentUpdatesViewController() {

    }
}
