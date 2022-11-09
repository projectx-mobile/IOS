//
//  AddNewUserInteractorIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: Interactor protocols
protocol AddNewUserInteractorInputProtocol: AnyObject {
    init(presenter: AddNewUserInteractorOutputProtocol)
}
protocol AddNewUserInteractorOutputProtocol: AnyObject {
}
