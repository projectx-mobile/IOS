//
//  ChildHomeScreenViewIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import Foundation

protocol ChildHomeScreenViewInputProtocol: AnyObject {
}

protocol ChildHomeScreenViewOutputProtocol: AnyObject {
    init(view: ChildHomeScreenViewInputProtocol)
}
