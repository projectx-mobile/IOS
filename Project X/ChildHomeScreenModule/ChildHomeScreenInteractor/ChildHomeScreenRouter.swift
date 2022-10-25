//
//  ChildHomeScreenRouter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 25.10.22.
//
import UIKit

protocol ChildHomeScreenRouterInputProtocol {
}

final class ChildHomeScreenRouter: ChildHomeScreenRouterInputProtocol {
    weak var navigationController: UINavigationController?

    required init(viewController: ChildHomeScreenViewController) {
    }
}
