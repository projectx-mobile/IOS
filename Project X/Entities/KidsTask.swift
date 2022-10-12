//
//  KidsTask.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 12.10.22.
//

import Foundation

struct KidsTask {
    let title: String
    let description: Description
    let done: Bool
    let points: Int
    
    enum Description: String {
        case today = "Сегодня"
        case done = "Готово"
        case requested = "Отправлен запрос"
        case missed = "Не в срок"
        case approved = "готово"
    }
}
