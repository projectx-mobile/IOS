//
//  EmailSettingInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Interactor class
final class EmailSettingInteractor: EmailSettingInteractorInputProtocol {
    unowned let presenter: EmailSettingInteractorOutputProtocol
    required init(presenter: EmailSettingInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
