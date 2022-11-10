//
//  CalendarDayModel.swift
//  Project X
//
//  Created by Александра Захаревич on 8.11.22.
//

import Foundation
import UIKit

struct CalendarDayModel {
    var selectedWeekDay: String
    var selectedDay: String
    
    static func fetchCalendarDayModel() -> [CalendarDayModel] {
        let chooseDay = CalendarDayModel(
            selectedWeekDay: "",
            selectedDay: "")
        return [chooseDay]
    }
}
