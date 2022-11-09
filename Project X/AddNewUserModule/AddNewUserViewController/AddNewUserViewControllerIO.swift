//
//  AddNewUserViewControllerIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: View protocols
protocol AddNewUserVCInputProtocol: AnyObject {
}
protocol AddNewUserVCOutputProtocol: AnyObject {
    init(view: AddNewUserVCInputProtocol)
}
