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
    func openNewVC(_ display: DisplayNames)
}
