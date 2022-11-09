//
//  SupportInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

// MARK: Interactor class
final class SupportInteractor: SupportInteractorInputProtocol {
    unowned let presenter: SupportInteractorOutputProtocol
    required init(presenter: SupportInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

