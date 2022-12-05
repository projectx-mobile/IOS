//
//  CustomizeProfileRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
import UIKit

protocol CustomizeProfileRouterProtocol {
    init(viewController: CustomizeProfileVC)

}

final class CustomizeProfileRouter: CustomizeProfileRouterProtocol {
    unowned let viewController: CustomizeProfileVC
    weak var navigationController: UINavigationController?
    required init(viewController: CustomizeProfileVC) {
        self.viewController = viewController
    }
}
