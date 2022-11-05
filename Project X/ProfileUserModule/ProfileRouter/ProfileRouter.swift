//
//  ProfileRouter.swift
//  Project X
//
//  Created by Alinser Shchurko on 5.11.22.
//

import Foundation
protocol ProfileRouterProtocol: AnyObject {
}
class ProfileRouter {
    weak var profileVC: ProfileVCProtocol?
}
extension ProfileRouter: ProfileRouterProtocol {
}
