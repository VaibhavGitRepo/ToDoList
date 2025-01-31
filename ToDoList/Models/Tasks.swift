//
//  Task.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 07/01/25.
//

import Foundation
import FirebaseFirestore

struct Tasks: Identifiable, Codable{
    @DocumentID var id: String?
    var title: String
    var description: String
    var isCompleted: Bool
    init(title: String, description: String, isCompleted: Bool) {
        self.id = UUID().uuidString
           self.title = title
           self.description = description
           self.isCompleted = isCompleted
       }
}
