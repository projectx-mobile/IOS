//
//  InviteUserByEmailInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 22.12.22.
//
import Foundation
final class EmailUserInviteInteractor: EmailUserInviteInteractorInputProtocol {
    unowned let presenter: EmailUserInviteInteractorOutputProtocol?
    required init(presenter: EmailUserInviteInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
