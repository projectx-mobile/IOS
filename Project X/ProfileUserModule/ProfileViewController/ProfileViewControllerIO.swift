//
//  ProfileViewControllerIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
import UIKit
protocol ProfileViewControllerInputProtocol: AnyObject {
 
}

protocol ProfileViewControllerOutputProtocol: AnyObject {
    init(view: ProfileViewControllerInputProtocol)
    func customizeProfile()
    func emailSetting()
    func passwordSetting()
    func userRoles()
    func notificationsVC()
    func addNewUser()
    func languageSettings()
    func support()
    func exit()
}
