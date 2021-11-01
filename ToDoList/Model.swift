//
//  Model.swift
//  ToDoList
//
//  Created by Abu FaisaL on 25/03/1443 AH.
//

import Foundation


struct TaskItem {
    
    var title : String
    var note : String

    
}

class List {
    var items = [TaskItem]()
}
