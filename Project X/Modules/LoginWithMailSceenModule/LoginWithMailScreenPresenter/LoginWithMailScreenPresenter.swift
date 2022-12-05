//
//  LoginWithMailScreenPresenter.swift
//  Project X
//
//  Created by Alina on 2.11.22.
//

import Foundation

final class LoginWithMailScreenPresenter: LoginWithMailScreenViewOutputProtocol {
    
    unowned let view: LoginWithMailScreenViewInputProtocol
    var interactor: LoginWithMailScreenInteractorInputProtocol!
    var router: LoginWithMailScreenRouterInputProtocol!
    
    required init (view: LoginWithMailScreenViewInputProtocol) {
        self.view = view
    }

}

// MARK: - LoginWithMailScreenInteractorOutputProtocol
extension LoginWithMailScreenPresenter: LoginWithMailScreenInteractorOutputProtocol{
    
}
