//
//  ChildHomeScreenInteractorIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 25.10.22.
//

import Foundation

protocol ChildHomeScreenInteractorInputProtocol: AnyObject {
    init(presenter: ChildHomeScreenInteractorOutputProtocol)
    func provideNumberOfNotifications()
    func provideNumberOfActiveTasks()
    func provideTextOfNotification()
    func deleteFirstNotification()
}

protocol ChildHomeScreenInteractorOutputProtocol: AnyObject {
    func receiveNumberOfNotifications(number: Int)
    func receiveNumberOfActiveTasks(number: Int)
    func receiveTextOfNotification(text: String)
}
