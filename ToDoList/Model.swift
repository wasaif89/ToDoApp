//
//  Model.swift
//  ToDoList

import Foundation


struct TaskItem {
    
    var title : String
    var note : String

    
}

class List {
    var items = [TaskItem]()
}
