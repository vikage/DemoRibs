//
//  Project.swift
//  DemoRibs
//
//  Created by Lan Nguyen on 03/08/2021.
//

import Foundation

class Project {
    var name: String
    var createAt: Date
    init(name: String, createAt: Date = Date()) {
        self.name = name
        self.createAt = createAt
    }
}
