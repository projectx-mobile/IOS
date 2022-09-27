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
}

protocol ParentHomeScreenViewOutputProtocol: AnyObject {
    init(view: ParentHomeScreenViewInputProtocol)
    func getNumberOfKidsCells()
    func getNumberOfUpdatesCells()
}
