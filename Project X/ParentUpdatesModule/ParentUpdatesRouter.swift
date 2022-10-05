//
//  ParentUpdatesRouter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 29.09.22.
//

import Foundation

protocol ParentUpdatesRouterInputProtocol {
    init(viewController: ParentUpdatesViewController)
}

final class ParentUpdatesRouter: ParentUpdatesRouterInputProtocol {
    
    unowned let viewController: ParentUpdatesViewController
    
    required init(viewController: ParentUpdatesViewController) {
        self.viewController = viewController
    }
}
