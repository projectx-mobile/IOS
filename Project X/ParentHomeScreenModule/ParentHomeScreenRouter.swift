//
//  ParentHomeScreenRouter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

protocol ParentHomeScreenRouterInputProtocol {
    init(viewController: ParentHomeScreenViewController)
    func openParentUpdatesViewController()
}

final class ParentHomeScreenRouter: ParentHomeScreenRouterInputProtocol {
    unowned let viewController: ParentHomeScreenViewController
    weak var navigationController: UINavigationController?
    required init(viewController: ParentHomeScreenViewController) {
        self.viewController = viewController
    }
    func openParentUpdatesViewController() {
        let parentUpdatesVC = ParentUpdatesViewController()
        let configurator: ParentUpdatesConfiguratorInputProtocol = ParentUpdatesConfigurator()
        configurator.configure(with: parentUpdatesVC)
        navigationController?.pushViewController(parentUpdatesVC, animated: true)
    }
}
