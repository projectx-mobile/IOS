//
//  LanguageSettingInteractorIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//
import Foundation
// MARK: Interactor protocols
protocol LanguageSettingInteractorInputProtocol: AnyObject {
    init(presenter: LanguageSettingInteractorOutputProtocol)
}
protocol LanguageSettingInteractorOutputProtocol: AnyObject {
}
