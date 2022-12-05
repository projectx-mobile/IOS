//
//  UserRolesInteractorIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation

protocol UserRolesInteractorInputProtocol: AnyObject {
    init(presenter: UserRolesInteractorOutputProtocol)
}
protocol UserRolesInteractorOutputProtocol: AnyObject {
}
