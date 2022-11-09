//
//  PasswordUpdateInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Interactor class
final class PasswordSettingInteractor: PasswordSettingInteractorInputProtocol {
    unowned let presenter: PasswordSettingInteractorOutputProtocol
    required init(presenter: PasswordSettingInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
