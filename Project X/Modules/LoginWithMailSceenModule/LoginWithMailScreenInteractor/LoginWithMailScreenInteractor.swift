//
//  LoginWithMailScreenInteractor.swift
//  Project X
//
//  Created by Alina on 2.11.22.
//

import Foundation

final class LoginWithMailScreenInteractor: LoginWithMailScreenInteractorInputProtocol {
    
    unowned let presenter: LoginWithMailScreenInteractorOutputProtocol
    
    required init(presenter: LoginWithMailScreenInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
}
