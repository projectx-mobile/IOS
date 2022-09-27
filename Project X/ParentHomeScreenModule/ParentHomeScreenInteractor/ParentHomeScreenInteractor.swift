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
    
    func provideNumberOfKids() {
        let kidsDataFromEntity = [KidsData(name: "Alice", numberOfTasks: 2, numberOfTasksDone: 1),
                        KidsData(name: "Mike", numberOfTasks: 4, numberOfTasksDone: 3), KidsData(name: "Harry", numberOfTasks: 8, numberOfTasksDone: 3)]
        let numberOfKids = kidsDataFromEntity.count
        presenter.receiveNumberOfKids(number: numberOfKids)
    }
    
    func provideNumberOfUpdates() {
        let updatesDataFromEntity:[KidsUpdates] = [KidsUpdates(name: "Mike", update: .created),
                                                   KidsUpdates(name: "Alice", update: .completed),
                                                   KidsUpdates(name: "Harry", update: .selected),
                                                   KidsUpdates(name: "Harry", update: .selected),
                                                   KidsUpdates(name: "Harry", update: .selected),
                                                   KidsUpdates(name: "Harry", update: .selected)
                  ]
        let numberOfUpdates = updatesDataFromEntity.count
        presenter.receiveNumberOfUpdates(number: numberOfUpdates)
    }
}
