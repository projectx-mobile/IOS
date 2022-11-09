//
//  PasswordUpdateConfiguratorIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: Interactor protocols
protocol PasswordSettingInteractorInputProtocol: AnyObject {
    init(presenter: PasswordSettingInteractorOutputProtocol)
}
protocol PasswordSettingInteractorOutputProtocol: AnyObject {
}
