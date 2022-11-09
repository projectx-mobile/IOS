//
//  PasswordUpdateRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
import UIKit
// MARK: Router protocol
protocol PasswordSettingRouterProtocol {
    init(viewController: PasswordSettingVC)

}
// MARK: Class EmailSettingRouter
final class PasswordSettingRouter: PasswordSettingRouterProtocol {
    unowned let viewController: PasswordSettingVC
    weak var navigationController: UINavigationController?
    required init(viewController: PasswordSettingVC) {
        self.viewController = viewController
    }
}
