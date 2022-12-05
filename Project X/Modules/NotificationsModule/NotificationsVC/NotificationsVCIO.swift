//
//  NotificationsVCIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: View protocols
protocol NotificationsVCInputProtocol: AnyObject {
}
protocol NotificationsVCOutputProtocol: AnyObject {
    init(view: NotificationsVCInputProtocol)
}
