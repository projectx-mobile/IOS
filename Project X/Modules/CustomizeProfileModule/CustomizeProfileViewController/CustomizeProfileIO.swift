//
//  CustomizeProfileIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
// MARK: View protocols
protocol CustomizeProfileVCInputProtocol: AnyObject {
}

protocol CustomizeProfileVCOutputProtocol: AnyObject {
    init(view: CustomizeProfileVCInputProtocol)
}
