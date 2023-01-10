//
//  TodoList.swift
//  tp-esirem-swift
//
//  Created by Tom Roth on 08/01/2023.
//

import Foundation

class TodoList {
    var name: String
    var todoCollection: [Todo]
    
    init(name: String) {
        self.name = name
        self.todoCollection = []
    }
}
