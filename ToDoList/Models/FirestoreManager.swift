//
//  FirestoreManager.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 30/01/25.
//

import Foundation
import FirebaseFirestore

class FirestoreManager {
    private var db = Firestore.firestore()

    // Fetch tasks from Firestore
    func fetchTasks(completion: @escaping ([Tasks]?, Error?) -> Void) {
        db.collection("app").document("vaibhav").collection("task").getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(nil, error)
                return
            }

            // Map documents to Tasks
            let tasks = querySnapshot?.documents.compactMap {
                try? $0.data(as: Tasks.self)
            } ?? []
            completion(tasks, nil)
        }
    }

    // Add a new task to Firestore
    func addTask(title: String, description: String, completion: @escaping (Error?) -> Void) {
        let newTask = Tasks(title: title, description: description, isCompleted: false)
        do {
            _ = try db.collection("app").document("vaibhav").collection("task").document(newTask.id!).setData(from: newTask)
            completion(nil)
        } catch {
            completion(error)
        }
    }

    // Update task completion status
    func updateTaskCompletion(task: Tasks, completion: @escaping (Error?) -> Void) {
        guard let taskId = task.id else {
            completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Task ID is nil"]))
            return
        }

        do {
            try db.collection("app").document("vaibhav").collection("task").document(taskId).setData(from: task)
            completion(nil)
        } catch {
            completion(error)
        }
    }

    // Delete task from Firestore
    func deleteTask(taskId: String, completion: @escaping (Error?) -> Void) {
        db.collection("app").document("vaibhav").collection("task").document(taskId).delete() { error in
            completion(error)
        }
    }

    // Update task title and description
    func updateTask(taskId: String, newTitle: String, newDescription: String, completion: @escaping (Error?) -> Void) {
        let taskRef = db.collection("app").document("vaibhav").collection("task").document(taskId)
        taskRef.updateData([
            "title": newTitle,
            "description": newDescription
        ]) { error in
            completion(error)
        }
    }
}
