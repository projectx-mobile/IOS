//
//  ProfileViewControllerIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//

import Foundation
import UIKit
protocol ProfileViewControllerInputProtocol: AnyObject {
    // Get info about user from Collection view (My Family)
    func userInfo(_ familyMember: FamilysMember)
    // Func for delete user in collection view My Family
    func deleteFamilyMember(_ familyMember: FamilysMember)
}

protocol ProfileViewControllerOutputProtocol: AnyObject {
    init(view: ProfileViewControllerInputProtocol)
    // One func for open others display. Get enum attribute and push needed display
    func openNewVC(_ display: DisplayNames)
    // Func open Modal Window Fmily member
    func transitToFamilyMember(_ familyMember: FamilysMember, isParent: Bool)
}
