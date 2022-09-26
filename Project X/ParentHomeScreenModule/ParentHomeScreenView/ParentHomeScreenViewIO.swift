//
//  ParentHomeScreenViewIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import Foundation

protocol ParentHomeScreenViewInputProtocol: AnyObject {
}

protocol ParentHomeScreenViewOutputProtocol {
    init(view: ParentHomeScreenViewInputProtocol)
}
