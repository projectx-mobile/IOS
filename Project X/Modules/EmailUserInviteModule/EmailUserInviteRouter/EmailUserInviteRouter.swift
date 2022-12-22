//
//  InviteUserByEmailRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 22.12.22.
//

import UIKit
protocol EmailUserInviteRouterProtocol: AnyObject {
    init(viewController: EmailUserInviteVc )
}
final class EmailUserInviteRouter: EmailUserInviteRouterProtocol {
    unowned let viewController: EmailUserInviteVc
    weak var navigationController: UINavigationController?
    required init(viewController: EmailUserInviteVc) {
        self.viewController = viewController
    }
    
 
}
