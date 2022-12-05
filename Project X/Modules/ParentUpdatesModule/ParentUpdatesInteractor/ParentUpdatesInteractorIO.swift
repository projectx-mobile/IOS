//
//  ParentUpdatesInteractorIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 29.09.22.
//

import Foundation

protocol ParentUpdatesInteractorInputProtocol: AnyObject {
    init(presenter: ParentUpdatesInteractorOutputProtocol)
    func provideNumberOfUpdates()
    func provideInfoForUpdatesCell(at indexpath: IndexPath)
}

protocol ParentUpdatesInteractorOutputProtocol: AnyObject {
    func receiveNumberOfUpdates(number: Int)
    func receiveInfoForUpdatesCell(info: KidsUpdates)
}
