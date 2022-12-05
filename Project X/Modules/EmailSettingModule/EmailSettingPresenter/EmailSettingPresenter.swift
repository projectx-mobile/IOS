//
//  EmailSettingPresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
//MARK: Presenter class
final class EmailSettingPresenter: EmailSettingVCOutputProtocol {
    unowned let view: EmailSettingVCInputProtocol
    var interactor: EmailSettingInteractorInputProtocol!
    var router: EmailSettingRouterProtocol!
    required init(view: EmailSettingVCInputProtocol) {
        self.view = view
    }
}
extension EmailSettingPresenter: EmailSettingInteractorOutputProtocol {
}
