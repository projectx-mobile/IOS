//
//  UserRolesInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation

final class UserRolesInteractor: UserRolesInteractorInputProtocol {
    
    unowned let presenter: UserRolesInteractorOutputProtocol
    
    required init(presenter: UserRolesInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
