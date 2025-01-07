//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 05/01/25.
//

import SwiftUI
import UIKit
import FirebaseCore


@main
struct SmartUtilityAppApp: App {
    @StateObject private var listViewModel = ListViewModel()
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(listViewModel)
                .onChange(of: scenePhase) { newScenePhase in
                    if newScenePhase == .background {
                        listViewModel.saveTasks()
                    }
                }
        }
    }
}

