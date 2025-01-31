//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 05/01/25.
//

import SwiftUI
import UIKit
import Firebase
import FirebaseCore


@main
struct ToDoListAppApp: App {
    @StateObject private var taskviewModel = TaskViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TaskViewModel())
        }
    }
}

