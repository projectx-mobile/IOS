//
//  ParentHomeScreenViewIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 15.09.22.
//

import Foundation

protocol ParentHomeScreenViewInputProtocol: AnyObject {
}

protocol ParentHomeScreenViewOutputProtocol {
    init(view: ParentHomeScreenViewInputProtocol)
}
