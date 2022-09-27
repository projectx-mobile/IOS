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
}

protocol ParentHomeScreenInteractorOutputProtocol: AnyObject {
    func receiveNumberOfKids(number: Int)
    func receiveNumberOfUpdates(number: Int)
}
