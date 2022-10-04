//
//  ChildHomeScreenInteractor.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import Foundation

final class ChildHomeScreenInteractor: ChildHomeScreenInteractorInputProtocol {
    unowned let presenter: ChildHomeScreenInteractorOutputProtocol
    
    required init(presenter: ChildHomeScreenInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
