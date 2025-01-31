//
//  NewTaskView.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 07/01/25.
//

import SwiftUI

struct NewTaskView: View {
    @EnvironmentObject var taskviewModel: TaskViewModel
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var bodyText: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                TextField("Title", text: $title)
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.primary)
                    .disableAutocorrection(true)
                Divider()
                TextEditor(text: $bodyText)
                    .padding(.horizontal)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .background(Color(.systemBackground))
        }
        .padding(.top)
        .navigationTitle("New Task")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    if !title.isEmpty {
                        taskviewModel.addTask(title: title,description: bodyText)
                        title = ""
                        bodyText = ""
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NewTaskView()
        .environmentObject(TaskViewModel())
}
