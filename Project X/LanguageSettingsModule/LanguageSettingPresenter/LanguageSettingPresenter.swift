//
//  LanguageSettingPresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//


import Foundation
// MARK: Presenter class
final class LanguageSettingPresenter: LanguageSettingVCOutputProtocol {
    unowned let view: LanguageSettingVCInputProtocol
    var interactor: LanguageSettingInteractorInputProtocol!
    var router: LanguageSettingRouterProtocol!
    required init(view: LanguageSettingVCInputProtocol) {
        self.view = view
    }
}
extension LanguageSettingPresenter: LanguageSettingInteractorOutputProtocol {
}
