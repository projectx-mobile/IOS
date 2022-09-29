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

class ParentHomeScreenRouter: ParentHomeScreenRouterInputProtocol {
    unowned let viewController: ParentHomeScreenViewController
    weak var navigationController: UINavigationController?
    
    required init(viewController: ParentHomeScreenViewController) {
        self.viewController = viewController
    }
    
    func openParentUpdatesViewController() {
        
        //        let configurator: ParentUpdatesConfiguratorInputProtocol = ParentUpdatesConfigurator()
        //        let updatesVC = ParentUpdatesViewController()
        //        configurator.configure(with: updatesVC)
        //        window?.rootViewController = updatesVC
        
        let parentUpdatesVC = ParentUpdatesViewController()
        let configurator: ParentUpdatesConfiguratorInputProtocol = ParentUpdatesConfigurator()
        configurator.configure(with: parentUpdatesVC)
        navigationController?.pushViewController(parentUpdatesVC, animated: true)
        
        
        
      //  newWorkoutViewController.modalPresentationStyle = .fullScreen
      //  present(newWorkoutViewController, animated: true, completion: nil)
    }
}
