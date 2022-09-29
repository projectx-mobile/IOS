//
//  ParentHomeScreenViewIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import Foundation

protocol ParentHomeScreenViewInputProtocol: AnyObject {
    func receiveNumberOfKidsCells(number: Int)
    func receiveNumberOfUpdatesCells(number: Int)
    func receiveInfoForKidsCells(info: KidsData)
    func receiveInfoForUpdatesCells(info: KidsUpdates)
    func receiveNumberOfActiveTasks(text: String)
}

protocol ParentHomeScreenViewOutputProtocol: AnyObject {
    init(view: ParentHomeScreenViewInputProtocol)
    func getNumberOfKidsCells()
    func getNumberOfUpdatesCells()
    func getInfoForKidsCell(at indexPath: IndexPath)
    func getInfoForUpdatesCell(at indexPath: IndexPath)
    func getNumberOfActiveTasks()
}
