//
//  EmailSettingInteractorIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: Interactor protocols
protocol EmailSettingInteractorInputProtocol: AnyObject {
    init(presenter: EmailSettingInteractorOutputProtocol)
}
protocol EmailSettingInteractorOutputProtocol: AnyObject {
}
