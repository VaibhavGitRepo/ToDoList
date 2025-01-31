//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 30/01/25.
//

import Foundation

class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Tasks] = []
    
    private var firestoreManager = FirestoreManager()
    func fetchTasks() {
        firestoreManager.fetchTasks { [weak self] tasks, error in
            if let error = error {
                print("Error fetching tasks: \(error.localizedDescription)")
                return
            }
            self?.tasks = tasks ?? []
        }
    }
    func addTask(title: String, description: String) {
        firestoreManager.addTask(title: title, description: description) { [weak self] error in
            if let error = error {
                print("Error adding task: \(error.localizedDescription)")
                return
            }
            self?.fetchTasks()
        }
    }
    func updateTaskCompletion(task: Tasks) {
        var updatedTask = task
        updatedTask.isCompleted.toggle()
        firestoreManager.updateTaskCompletion(task: updatedTask) { [weak self] error in
            if let error = error {
                print("Error updating task completion: \(error.localizedDescription)")
                return
            }
            self?.fetchTasks()
        }
    }
    func deleteTask(taskId: String) {
        firestoreManager.deleteTask(taskId: taskId) { [weak self] error in
            if let error = error {
                print("Error deleting task: \(error.localizedDescription)")
                return
            }
            self?.fetchTasks()
        }
    }
    func updateTask(taskId: String, newTitle: String, newDescription: String) {
        firestoreManager.updateTask(taskId: taskId, newTitle: newTitle, newDescription: newDescription) { [weak self] error in
            if let error = error {
                print("Error updating task: \(error.localizedDescription)")
                return
            }
            self?.fetchTasks()
        }
    }
}
