//
//  ParentHomeScreenInteractorIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import Foundation

protocol ParentHomeScreenInteractorInputProtocol: AnyObject {
    init(presenter: ParentHomeScreenInteractorOutputProtocol)
    func provideNumberOfKids()
    func provideNumberOfUpdates()
    func provideInfoForKidsCell(at indexpath: IndexPath)
    func provideInfoForUpdatesCell(at indexpath: IndexPath)
    func provideNumberOfActiveTasks()
}

protocol ParentHomeScreenInteractorOutputProtocol: AnyObject {
    func receiveNumberOfKids(number: Int)
    func receiveNumberOfUpdates(number: Int)
    func receiveInfoForKidsCell(info: KidsData)
    func receiveInfoForUpdatesCell(info: KidsUpdates)
    func receiveNumberOfActiveTasks(number: Int)
}
