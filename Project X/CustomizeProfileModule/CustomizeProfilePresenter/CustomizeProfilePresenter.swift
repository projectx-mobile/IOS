//
//  CustomizeProfilePresenter.swift
//  Project X
//
//  Created by Alinser Shchurko on 7.11.22.
//

import Foundation

final class CustomizeProfilePresenter: CustomizeProfileVCOutputProtocol {
    unowned let view: CustomizeProfileVCInputProtocol
    var interactor: CustomizeProfileInteractorInputProtocol!
    var router: CustomizeProfileRouterProtocol!
    required init(view: CustomizeProfileVCInputProtocol) {
        self.view = view
    }
}
extension CustomizeProfilePresenter: CustomizeProfileInteractorOutputProtocol {
}
