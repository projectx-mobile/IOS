//
//  WelcomeCellModel.swift
//  Project X
//
//  Created by Александра Захаревич on 31.10.22.
//

import Foundation
import UIKit
import Lottie

struct WelcomeCellModel {
    var subtitle: String
    var animationName: String
    
    static func fetchWelcomeModel() -> [WelcomeCellModel] {
        let firstItem = WelcomeCellModel(
            subtitle: "Создавай задачи \nи выполняй их в срок",
            animationName: "antframe1"
        )
        let secondItem = WelcomeCellModel(
            subtitle: "Достигай цели \nи получай награды",
            animationName: "frame 2 onboarding"
        )
        return [firstItem, secondItem]
    }
}
