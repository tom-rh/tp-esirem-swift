//
//  Todo.swift
//  tp-esirem-swift
//
//  Created by Tom Roth on 07/11/2022.
//

import Foundation

class Todo {
    var name: String
    var desc: String
    var done: Bool
    var date: Date
    
    init(name: String, desc: String) {
        self.name = name
        self.desc = desc
        self.done = false
        self.date = Date()
    }
}
