//
//  WelcomeInteractor.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import Foundation

 final class WelcomeInteractor: WelcomeInteractorInputProtocol {

    unowned let presenter: WelcomeInteractorOutputProtocol

    required init(presenter: WelcomeInteractorOutputProtocol) {
        self.presenter = presenter
    }
 }
