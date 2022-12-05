//
//  CustomizeProfileInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Interactor class
final class CustomizeProfileInteractor: CustomizeProfileInteractorInputProtocol {
    unowned let presenter: CustomizeProfileInteractorOutputProtocol
    required init(presenter: CustomizeProfileInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
