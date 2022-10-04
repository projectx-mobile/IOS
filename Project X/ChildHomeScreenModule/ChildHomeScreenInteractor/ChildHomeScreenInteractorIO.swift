//
//  ChildHomeScreenInteractorIO.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 4.10.22.
//

import Foundation

protocol ChildHomeScreenInteractorInputProtocol: AnyObject {
    init(presenter: ChildHomeScreenInteractorOutputProtocol)
    func provideNumberOfNotifications()
    func provideTextOfNotification()
}

protocol ChildHomeScreenInteractorOutputProtocol: AnyObject {
    func receiveNumberOfNotifications(number: Int)
    func receiveTextOfNotification(text: String)
}
