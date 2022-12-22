//
//  AddNewUserRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//
import UIKit
// MARK: Router protocol
protocol AddNewUserRouterProtocol {
    init(viewController: AddNewUserVC)
    func openEmailInvite()
    func openLinkInvite()
    func inviteFamilyID()
}
// MARK: Router Class 
final class AddNewUserRouter: AddNewUserRouterProtocol {
    func openLinkInvite() {
        print("")
    }
    
    func inviteFamilyID() {
        print("")
    }
    unowned let viewController: AddNewUserVC
    weak var navigationController: UINavigationController?
    required init(viewController: AddNewUserVC) {
        self.viewController = viewController
    }
    // MARK: Open notification display
    func openEmailInvite() {
        let viewController = EmailUserInviteVc()
        let configurator: EmailUserInviteConfiguratorInputProtocol = EmailUserInviteConfigurator()
        configurator.configure(with: viewController)
        self.viewController.navigationController?.pushViewController(viewController, animated: true)
    }
}
