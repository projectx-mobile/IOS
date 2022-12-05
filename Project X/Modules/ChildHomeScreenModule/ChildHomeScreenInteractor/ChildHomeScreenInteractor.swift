//
//  ChildHomeScreenInteractor.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 25.10.22.
//

import Foundation

final class ChildHomeScreenInteractor: ChildHomeScreenInteractorInputProtocol {
    unowned let presenter: ChildHomeScreenInteractorOutputProtocol

    required init(presenter: ChildHomeScreenInteractorOutputProtocol) {
        self.presenter = presenter
    }

    var kidsNotificationsFromEntity: [KidsNotification] = [
        KidsNotification(text: "У тебя появилась первая новая задача на сегодня, постарайся успеть."),
        KidsNotification(text: "У тебя появилась новая задача на сегодня, постарайся успеть."),
        KidsNotification(text: "Исткело время, выделенное на выполнение задачи.")
    ]
    
    var activeTasksFromEntity: [KidsTask] = [
        KidsTask(title: "Clean the room", description: .today, done: false, points: 30),
        KidsTask(title: "Water the flowers", description: .today, done: false, points: 10),
        KidsTask(title: "Wash the cat", description: .today, done: false, points: 40),
        KidsTask(title: "Do your homework", description: .missed, done: false, points: 20),
        KidsTask(title: "Read 30 pages", description: .today, done: false, points: 30),
    ]

    func provideNumberOfNotifications() {
        let numberOfNotifications = kidsNotificationsFromEntity.count
        presenter.receiveNumberOfNotifications(number: numberOfNotifications)
    }
    
    func provideNumberOfActiveTasks() {
        let numberOfActiveTasks = activeTasksFromEntity.filter { $0.description == .today && $0.done == false}.count
        presenter.receiveNumberOfActiveTasks(number: numberOfActiveTasks)
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
