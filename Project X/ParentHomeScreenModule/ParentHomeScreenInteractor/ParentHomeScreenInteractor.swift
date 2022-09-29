//
//  ParentHomeScreenInteractor.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import Foundation

class ParentHomeScreenInteractor: ParentHomeScreenInteractorInputProtocol {
    unowned let presenter: ParentHomeScreenInteractorOutputProtocol
    
    required init(presenter: ParentHomeScreenInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    let kidsDataFromEntity = [KidsData(name: "Alice", numberOfTasks: 2, numberOfTasksDone: 1, kidsImage: "boy"),
                              KidsData(name: "Mike", numberOfTasks: 4, numberOfTasksDone: 3), KidsData(name: "Harry", numberOfTasks: 8, numberOfTasksDone: 3)]
    
    let updatesDataFromEntity:[KidsUpdates] = [KidsUpdates(name: "Mike", update: .created),
                                               KidsUpdates(name: "Alice", update: .completed),
                                               KidsUpdates(name: "Harry", update: .selected),
                                               KidsUpdates(name: "Harry", update: .selected),
                                               KidsUpdates(name: "Harry", update: .selected),
                                               KidsUpdates(name: "Harry", update: .selected)
                                               ]
    
    func provideNumberOfKids() {
        let numberOfKids = kidsDataFromEntity.count
        presenter.receiveNumberOfKids(number: numberOfKids)
    }
    
    func provideNumberOfUpdates() {
        let numberOfUpdates = updatesDataFromEntity.count
        presenter.receiveNumberOfUpdates(number: numberOfUpdates)
    }
    
    func provideInfoForKidsCell(at indexPath: IndexPath){
        let kidData = kidsDataFromEntity[indexPath.row]
        presenter.receiveInfoForKidsCell(info: kidData)
    }
    
    func provideInfoForUpdatesCell(at indexpath: IndexPath) {
        let updateData = updatesDataFromEntity[indexpath.row]
        presenter.receiveInfoForUpdatesCell(info: updateData)
    }
    
    func provideNumberOfActiveTasks() {
        let numberOfActiveTasks = kidsDataFromEntity.reduce(0){total, kid in
            total + kid.numberOfTasks
        }
        presenter.receiveNumberOfActiveTasks(number: numberOfActiveTasks)
    }
}
