//
//  WelcomePresenter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 8.09.22.
//

import Foundation

final class WelcomePresenter: WelcomeViewOutputProtocol{
    
    unowned let view: WelcomeViewInputProtocol
    var interactor: WelcomeInteractorInputProtocol!
    var router: WelcomeRouterInputProtocol!
    
    required init(view: WelcomeViewInputProtocol) {
        self.view = view
    }
}

// MARK: - WelcomeInteractorOutputProtocol
extension WelcomePresenter: WelcomeInteractorOutputProtocol {
    
}
