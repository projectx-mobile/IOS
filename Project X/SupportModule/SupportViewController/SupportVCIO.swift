//
//  SupportViewControllerIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: View protocols
protocol SupportVCInputProtocol: AnyObject {
}
protocol SupportVCOutputProtocol: AnyObject {
    init(view: SupportVCInputProtocol)
}
