//
//  ParentUpdatesPresenter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 29.09.22.
//

import Foundation

struct UpdatesTableInformation {
    let name: String
    let update: Action

    enum Action: String {
        case selected = "selected reward"
        case completed = "completed task"
        case created = "created new task"
    }
}

class ParentUpdatesPresenter: ParentUpdatesViewOutputProtocol {
    unowned let view: ParentUpdatesViewInputProtocol
    var interactor: ParentUpdatesInteractorInputProtocol!
    var router: ParentUpdatesRouterInputProtocol!

    required init(view: ParentUpdatesViewInputProtocol) {
        self.view = view
    }

    func getNumberOfUpdatesCells() {
        interactor.provideNumberOfUpdates()
    }

    func getInfoForUpdatesCell(at indexPath: IndexPath) {
        interactor.provideInfoForUpdatesCell(at: indexPath)
    }
}

// MARK: - ParentUpdatesInteractorOutputProtocol
extension ParentUpdatesPresenter: ParentUpdatesInteractorOutputProtocol {
    func receiveNumberOfUpdates(number: Int) {
        let numberOfCells = number
        view.receiveNumberOfUpdatesCells(number: numberOfCells)
    }

    func receiveInfoForUpdatesCell(info: KidsUpdates) {
        view.receiveInfoForUpdatesCells(info: info)
    }
}
