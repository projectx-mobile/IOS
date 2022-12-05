//
//  LanguageSettingInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//


// MARK: Interactor class
final class LanguageSettingInteractor: LanguageSettingInteractorInputProtocol {
    unowned let presenter: LanguageSettingInteractorOutputProtocol
    required init(presenter: LanguageSettingInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
