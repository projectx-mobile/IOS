//
//  UserRolesRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
import UIKit

//protocol UserRolesRouterProtocol: AnyObject {
//}
//
//final class UserRolesRouter {
//    var viewController: UserRolesVC?
//}
//
//extension UserRolesRouter: UserRolesRouterProtocol {
//}
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
