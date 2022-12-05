//
//  LoginWithGAScreenPresenter.swift
//  Project X
//
//  Created by Alina on 27.10.22.
//

import Foundation

final class LoginWithGAScreenPresenter: LoginWithGAScreenViewOutputProtocol {
    
    unowned let view: LoginWithGAScreenViewInputProtocol
    var interactor: LoginWithGAScreenInteractorInputProtocol!
    var router: LoginWithGAScreenRouterInputProtocol!
    
    required init (view: LoginWithGAScreenViewInputProtocol) {
        self.view = view
    }

}

// MARK: - LoginWithGAScreenInteractorOutputProtocol
extension LoginWithGAScreenPresenter: LoginWithGAScreenInteractorOutputProtocol{
    
}
