//
//  EmailSettingRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
import UIKit
// MARK: Router protocol
protocol EmailSettingRouterProtocol {
    init(viewController: EmailSettingVC)

}
// MARK: Class EmailSettingRouter
final class EmailSettingRouter: EmailSettingRouterProtocol {
    unowned let viewController: EmailSettingVC
    weak var navigationController: UINavigationController?
    required init(viewController: EmailSettingVC) {
        self.viewController = viewController
    }
}
