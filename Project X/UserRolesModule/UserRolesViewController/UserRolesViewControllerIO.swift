//
//  UserRolesIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation

protocol UserRolesViewControllerInputProtocol: AnyObject {
}

protocol UserRolesViewControllerOutputProtocol: AnyObject {
    init(view: UserRolesViewControllerInputProtocol)
}
