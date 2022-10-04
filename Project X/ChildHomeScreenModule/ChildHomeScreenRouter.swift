//
//  ChildHomeScreenRouter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import UIKit

protocol ChildHomeScreenRouterInputProtocol {
    init(viewController: ChildHomeScreenViewController)
}

final class ChildHomeScreenRouter: ChildHomeScreenRouterInputProtocol {
    unowned let viewController: ChildHomeScreenViewController
    weak var navigationController: UINavigationController?
    
    required init(viewController: ChildHomeScreenViewController) {
        self.viewController = viewController
    }
}
