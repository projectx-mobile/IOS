//
//  ParentHomeScreenRouter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import Foundation

protocol ParentHomeScreenRouterInputProtocol {
    init(viewController: ParentHomeScreenViewController)
}

class ParentHomeScreenRouter: ParentHomeScreenRouterInputProtocol {
    
    unowned let viewController: ParentHomeScreenViewController
    
    required init(viewController: ParentHomeScreenViewController) {
        self.viewController = viewController
    }
}
