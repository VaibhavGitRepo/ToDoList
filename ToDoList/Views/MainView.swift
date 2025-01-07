//
//  MainView.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 07/01/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "gear")
                }
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    MainView()
}
