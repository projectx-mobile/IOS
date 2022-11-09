//
//  PasswordUpdateViewControllerIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: View protocols
protocol PasswordSettingVCInputProtocol: AnyObject {
}
protocol PasswordSettingVCOutputProtocol: AnyObject {
    init(view: PasswordSettingVCInputProtocol)
}
