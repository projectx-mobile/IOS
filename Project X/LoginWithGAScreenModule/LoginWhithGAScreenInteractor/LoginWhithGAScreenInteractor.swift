//
//  LoginWhithGAInteractor.swift
//  Project X
//
//  Created by Alina on 27.10.22.
//

import Foundation

final class LoginWithGAScreenInteractor: LoginWithGAScreenInteractorInputProtocol {
    
    unowned let presenter: LoginWithGAScreenInteractorOutputProtocol
    
    required init(presenter: LoginWithGAScreenInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
}
