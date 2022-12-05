//
//  EmailSettinsViewControllerIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: View protocols
protocol EmailSettingVCInputProtocol: AnyObject {
}
protocol EmailSettingVCOutputProtocol: AnyObject {
    init(view: EmailSettingVCInputProtocol)
}
