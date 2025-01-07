//
//  Task.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 07/01/25.
//

import Foundation

struct Tasks: Identifiable, Codable{
    var id: UUID
    var title: String
    var description: String
    var isCompleted: Bool
    init(title: String, description: String, isCompleted: Bool) {
           self.id = UUID()
           self.title = title
           self.description = description
           self.isCompleted = isCompleted
       }
}
