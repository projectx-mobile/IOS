//
//  AddNewUserRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
import UIKit
// MARK: Router protocol
protocol AddNewUserRouterProtocol {
    init(viewController: AddNewUserVC)
}
// MARK: Router Class 
final class AddNewUserRouter: AddNewUserRouterProtocol {
    unowned let viewController: AddNewUserVC
    weak var navigationController: UINavigationController?
    required init(viewController: AddNewUserVC) {
        self.viewController = viewController
    }
}
