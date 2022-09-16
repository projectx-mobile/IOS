//
//  ParentHomeScreenPresenter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import Foundation

struct KidsData {
    let name: String
    var numberOfTasks: Int
    var numberOfTasksDone: Int
}

class ParentHomeScreenPresenter: ParentHomeScreenViewOutputProtocol{
    
    unowned let view: ParentHomeScreenViewInputProtocol
    var interactor: ParentHomeScreenInteractorInputProtocol!
    var router: ParentHomeScreenRouterInputProtocol!
    
    required init(view: ParentHomeScreenViewInputProtocol) {
        self.view = view
    }

}

// MARK: - ParentHomeScreenInteractorOutputProtocol
extension ParentHomeScreenPresenter: ParentHomeScreenInteractorOutputProtocol {
    
}
