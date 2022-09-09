//
//  WelcomeInteractor.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 8.09.22.
//

import Foundation

protocol WelcomeInteractorInputProtocol {
   init(presenter: WelcomeInteractorOutputProtocol)
}

protocol WelcomeInteractorOutputProtocol: AnyObject {
}

class WelcomeInteractor: WelcomeInteractorInputProtocol {
   
   unowned let presenter: WelcomeInteractorOutputProtocol
   
   required init(presenter: WelcomeInteractorOutputProtocol) {
       self.presenter = presenter
   }
}
