//
//  LoginWithMailScreenRouter.swift
//  Project X
//
//  Created by Alina on 2.11.22.
//

import UIKit

protocol LoginWithMailScreenRouterInputProtocol {
    
}

final class LoginWithMailScreenRouter: LoginWithMailScreenRouterInputProtocol {
    weak var navigationController: UINavigationController?
    
    required init(viewController: LoginWithMailScreenViewController) {
    }
}
