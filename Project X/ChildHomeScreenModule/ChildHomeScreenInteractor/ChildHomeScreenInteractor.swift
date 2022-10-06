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
    
    var kidsNotificationsFromEntity:[KidsNotification] = [
        KidsNotification(text: "У тебя появилась первая новая задача на сегодня, постарайся успеть."),
        KidsNotification(text: "У тебя появилась новая задача на сегодня, постарайся успеть."),
        KidsNotification(text: "Исткело время, выделенное на выполнение задачи.")
    ]

    func provideNumberOfNotifications() {
        let numberOfNotifications = kidsNotificationsFromEntity.count
        presenter.receiveNumberOfNotifications(number: numberOfNotifications)
    }
    
    func provideTextOfNotification() {
        let text = kidsNotificationsFromEntity[0].text
        presenter.receiveTextOfNotification(text: text)
    }
    
    func deleteFirstNotification() {
        if kidsNotificationsFromEntity.count > 0 {
            kidsNotificationsFromEntity.removeFirst()
        }
        let numberOfNotifications = kidsNotificationsFromEntity.count
        presenter.receiveNumberOfNotifications(number: numberOfNotifications)
        if numberOfNotifications > 0 {
            let text = kidsNotificationsFromEntity[0].text
            presenter.receiveTextOfNotification(text: text)
        }
    }
}
