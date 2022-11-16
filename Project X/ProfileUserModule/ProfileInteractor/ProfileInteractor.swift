//
//  ProfileInteractor.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
final class ProfileInteractor: ProfileInteractorInputProtocol {
   
    
    unowned let presenter: ProfileInteractorOutputProtocol?
    required init(presenter: ProfileInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
