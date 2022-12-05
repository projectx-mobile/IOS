//
//  SupportPresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation
// MARK: Presenter class
final class SupportPresenter: SupportVCOutputProtocol {
    unowned let view: SupportVCInputProtocol
    var interactor: SupportInteractorInputProtocol!
    var router: SupportRouterProtocol!
    required init(view: SupportVCInputProtocol) {
        self.view = view
    }
}
extension SupportPresenter: SupportInteractorOutputProtocol {
}



