//
//  TaskDetailView.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 07/01/25.
//

import SwiftUI

struct TaskDetailView: View {
    @EnvironmentObject var taskViewModel: ListViewModel
    @State private var editedTitle: String
    @State private var editedDescription: String
    @Environment(\.dismiss) var dismiss
    var task: Tasks
    
    init(task: Tasks) {
        self.task = task
        _editedTitle = State(initialValue: task.title)
        _editedDescription = State(initialValue: task.description)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Title", text: $editedTitle)
                .font(.title)
                .padding(.horizontal)
                .foregroundColor(.primary)
                .disableAutocorrection(true)
            
            Divider()

            TextEditor(text: $editedDescription)
                .padding(.horizontal)
                .font(.body)
                .foregroundColor(.secondary)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Task Details")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    editedTitle = task.title
                    editedDescription = task.description
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    taskViewModel.updateTask(id: task.id, newTitle: editedTitle, newDescription: editedDescription)
                    dismiss()
                }
            }
        }
    }
}

