//
//  Entity.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import Foundation

struct KidsData {
    let name: String
    var numberOfTasks: Int
    var numberOfTasksDone: Int
}


struct KidsUpdates {
    let name: String
    let update: Action
    
    enum Action: String {
        case selected = "selected reward"
        case completed = "completed task"
        case created = "created new task"
    }
}
