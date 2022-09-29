//
//  ParentUpdatesInteractor.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 29.09.22.
//

import Foundation

class ParentUpdatesInteractor: ParentUpdatesInteractorInputProtocol {
    unowned let presenter: ParentUpdatesInteractorOutputProtocol
    
    required init(presenter: ParentUpdatesInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    let updatesDataFromEntity:[KidsUpdates] = [KidsUpdates(name: "Mike", update: .created),
                                               KidsUpdates(name: "Alice", update: .completed),
                                               KidsUpdates(name: "Harry", update: .selected),
                                               KidsUpdates(name: "Harry", update: .selected),
                                               KidsUpdates(name: "Harry", update: .selected),
                                               KidsUpdates(name: "Harry", update: .selected),
                                               KidsUpdates(name: "Mike", update: .created),
                                               KidsUpdates(name: "Alice", update: .completed),
                                               KidsUpdates(name: "Mike", update: .created),
                                               KidsUpdates(name: "Alice", update: .completed),
                                               KidsUpdates(name: "Mike", update: .created),
                                               KidsUpdates(name: "Alice", update: .completed),
                                               KidsUpdates(name: "Mike", update: .created),
                                               KidsUpdates(name: "Alice", update: .completed)
    ]
    func provideNumberOfUpdates() {
        let numberOfUpdates = updatesDataFromEntity.count
        presenter.receiveNumberOfUpdates(number: numberOfUpdates)
    }
    
    func provideInfoForUpdatesCell(at indexpath: IndexPath) {
        let updateData = updatesDataFromEntity[indexpath.row]
        presenter.receiveInfoForUpdatesCell(info: updateData)
    }
}
