//
//  InviteUserByEmailProtocol.swift
//  Project X
//
//  Created by Alinser Shchurko on 22.12.22.
//

import Foundation
protocol EmailUserInviteVcInputProtocol: AnyObject {
}

protocol EmailUserInviteVcOutputProtocol: AnyObject {
    init(view: EmailUserInviteVcInputProtocol)
    
}
