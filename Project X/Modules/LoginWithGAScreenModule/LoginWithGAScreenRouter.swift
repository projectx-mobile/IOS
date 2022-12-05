//
//  LoginWithGAScreenRouter.swift
//  Project X
//
//  Created by Alina on 27.10.22.
//

import UIKit

protocol LoginWithGAScreenRouterInputProtocol {
    
}

final class LoginWithGAScreenRouter: LoginWithGAScreenRouterInputProtocol {
    weak var navigationController: UINavigationController?
    
    required init(viewController: LoginWithGAScreenViewController) {
    }
}
