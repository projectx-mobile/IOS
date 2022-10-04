//
//  ChildHomeScreenPresenter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import Foundation

final class ChildHomeScreenPresenter: ChildHomeScreenViewOutputProtocol{
    
    unowned let view: ChildHomeScreenViewInputProtocol
    var interactor: ChildHomeScreenInteractorInputProtocol!
    var router: ChildHomeScreenRouterInputProtocol!
    
    required init(view: ChildHomeScreenViewInputProtocol) {
        self.view = view
    }
}

// MARK: - ChildHomeScreenInteractorOutputProtocol
extension ChildHomeScreenPresenter: ChildHomeScreenInteractorOutputProtocol {
}
