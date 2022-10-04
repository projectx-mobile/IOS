//
//  ChildHomeScreenPresenter.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import Foundation

struct Notification {
    let text: String
}

final class ChildHomeScreenPresenter: ChildHomeScreenViewOutputProtocol{

    unowned let view: ChildHomeScreenViewInputProtocol
    var interactor: ChildHomeScreenInteractorInputProtocol!
    var router: ChildHomeScreenRouterInputProtocol!
    
    var notifications: [Notification] = []
    
    required init(view: ChildHomeScreenViewInputProtocol) {
        self.view = view
    }
    
    func getNumberOfNotifications() {
        interactor.provideNumberOfNotifications()
    }
    
    func getTextOfNotification() {
        interactor.provideTextOfNotification()
    }
}

// MARK: - ChildHomeScreenInteractorOutputProtocol
extension ChildHomeScreenPresenter: ChildHomeScreenInteractorOutputProtocol {
    func receiveNumberOfNotifications(number: Int) {
        let numberOfNotifications = number
        view.receiveNumberOfNotifications(number: numberOfNotifications)
    }
    
    func receiveTextOfNotification(text: String) {
        let textOfNotification = text
        view.receiveTextOfNotification(text: textOfNotification)
    }
}
