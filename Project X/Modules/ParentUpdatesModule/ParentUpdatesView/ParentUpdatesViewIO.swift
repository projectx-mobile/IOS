//
//  ParentUpdatesViewIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 29.09.22.
//

import Foundation

protocol ParentUpdatesViewInputProtocol: AnyObject {
    func receiveNumberOfUpdatesCells(number: Int)
    func receiveInfoForUpdatesCells(info: KidsUpdates)
}

protocol ParentUpdatesViewOutputProtocol: AnyObject {
    init(view: ParentUpdatesViewInputProtocol)
    func getNumberOfUpdatesCells()
    func getInfoForUpdatesCell(at indexPath: IndexPath)
}
