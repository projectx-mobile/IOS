//
//  PasswordUpdatePresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Presenter class
final class PasswordSettingPresenter: PasswordSettingVCOutputProtocol {
    unowned let view: PasswordSettingVCInputProtocol
    var interactor: PasswordSettingInteractorInputProtocol!
    var router: PasswordSettingRouterProtocol!
    required init(view: PasswordSettingVCInputProtocol) {
        self.view = view
    }
}
extension PasswordSettingPresenter: PasswordSettingInteractorOutputProtocol {
}
