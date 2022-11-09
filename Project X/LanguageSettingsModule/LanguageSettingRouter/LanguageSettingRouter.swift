//
//  LanguageSettingRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//


import Foundation
import UIKit
// MARK: Router protocol
protocol LanguageSettingRouterProtocol {
    init(viewController: LanguageSettingVC)
}
// MARK: Router Class
final class LanguageSettingRouter: LanguageSettingRouterProtocol {
    unowned let viewController: LanguageSettingVC
    weak var navigationController: UINavigationController?
    required init(viewController: LanguageSettingVC) {
        self.viewController = viewController
    }
}
