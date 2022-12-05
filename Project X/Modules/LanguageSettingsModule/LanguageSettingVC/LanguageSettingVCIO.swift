//
//  LanguageSettingViewControllerIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: View protocols
protocol LanguageSettingVCInputProtocol: AnyObject {
}
protocol LanguageSettingVCOutputProtocol: AnyObject {
    init(view: LanguageSettingVCInputProtocol)
}
