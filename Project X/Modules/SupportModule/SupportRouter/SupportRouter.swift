//
//  SupportVRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
import UIKit
// MARK: Router protocol
protocol SupportRouterProtocol {
    init(viewController: SupportVC)
}
// MARK: Router Class
final class SupportRouter: SupportRouterProtocol {
    unowned let viewController: SupportVC
    weak var navigationController: UINavigationController?
    required init(viewController: SupportVC) {
        self.viewController = viewController
    }
}
