//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 07/01/25.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    @Published var items: [Tasks] = []
    
    private let tasksKey = "tasksKey" 
    
    init() {
        loadTasks()
    }
    func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: tasksKey) {
            let decoder = JSONDecoder()
            if let decodedItems = try? decoder.decode([Tasks].self, from: data) {
                self.items = decodedItems
            }
        }
    }
    func saveTasks() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(items) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
    
    func addTask(title: String, description: String) {
        let newTask = Tasks(title: title, description: description, isCompleted: false)
        items.append(newTask)
        saveTasks()
    }
    func toggleCompletion(for task: Tasks) {
        if let index = items.firstIndex(where: { $0.id == task.id }) {
            items[index].isCompleted.toggle()
            saveTasks()
        }
    }
    func updateTask(id: UUID, newTitle: String, newDescription: String) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].title = newTitle
            items[index].description = newDescription
        }
    }
}
