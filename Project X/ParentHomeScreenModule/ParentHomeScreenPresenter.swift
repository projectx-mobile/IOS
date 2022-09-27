//
//  ParentHomeScreenPresenter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import Foundation

struct KidsInformation {
    let name: String
    var numberOfTasks: Int
    var numberOfTasksDone: Int
}

struct UpdatesInformation {
    let name: String
    let update: Action
    
    enum Action: String {
        case selected = "selected reward"
        case completed = "completed task"
        case created = "created new task"
    }
}

class ParentHomeScreenPresenter: ParentHomeScreenViewOutputProtocol{
    unowned let view: ParentHomeScreenViewInputProtocol
    var interactor: ParentHomeScreenInteractorInputProtocol!
    var router: ParentHomeScreenRouterInputProtocol!
    
    required init(view: ParentHomeScreenViewInputProtocol) {
        self.view = view
    }
    
    func getNumberOfKidsCells() {
        interactor.provideNumberOfKids()
    }
    func getNumberOfUpdatesCells() {
        interactor.provideNumberOfUpdates()
    }
}

// MARK: - ParentHomeScreenInteractorOutputProtocol
extension ParentHomeScreenPresenter: ParentHomeScreenInteractorOutputProtocol {
    func receiveNumberOfKids(number: Int) {
        let numberOfCells = number
        view.receiveNumberOfKidsCells(number: numberOfCells)
    }
    
    func receiveNumberOfUpdates(number: Int) {
        let numberOfCells = number
        view.receiveNumberOfUpdatesCells(number: numberOfCells)
    }
    
}
