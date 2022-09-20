//
//  WelcomeRouter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 8.09.22.
//

import Foundation

protocol WelcomeRouterInputProtocol {
    init(viewController: WelcomeViewController)
}

final class WelcomeRouter: WelcomeRouterInputProtocol {
    
    unowned let viewController: WelcomeViewController
    
    required init(viewController: WelcomeViewController) {
        self.viewController = viewController
    }
}
