//
//  AddNewUserInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Interactor class
final class AddNewUserInteractor: AddNewUserInteractorInputProtocol {
    unowned let presenter: AddNewUserInteractorOutputProtocol
    required init(presenter: AddNewUserInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
