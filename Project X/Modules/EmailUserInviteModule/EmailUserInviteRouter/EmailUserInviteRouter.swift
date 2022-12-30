//
//  InviteUserByEmailRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 22.12.22.
//

import UIKit

protocol EmailUserInviteRouterProtocol: AnyObject {
    init(viewController: EmailUserInviteVc)
    func popToProfileVc()
}
final class EmailUserInviteRouter: EmailUserInviteRouterProtocol {
    unowned let viewController: EmailUserInviteVc
    weak var navigationController: UINavigationController?
    required init(viewController: EmailUserInviteVc) {
        self.viewController = viewController
    }
    func popToProfileVc() {
        if let profileScreenVc = viewController.navigationController?.viewControllers.filter({ $0 is ProfileViewController }).first {
            viewController.navigationController?.popToViewController(profileScreenVc, animated: true)
        }
    }
}
