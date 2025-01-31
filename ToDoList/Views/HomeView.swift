//
//  HomeView.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 05/01/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var taskviewModel: TaskViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 20){
                    profileView
                    taskTitle
                    Divider()
                        .frame(height: 1)
                    ForEach(taskviewModel.tasks){task in
                        NavigationLink(destination: TaskDetailView(task: task)) {
                            ListRowView(data: task)
                                    .foregroundColor(.primary)
                            }
                        }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.vertical)
            .padding(.horizontal)
            .toolbarRole(.editor)
        }
        .onAppear{
            taskviewModel.fetchTasks()
        }
    }
    private var profileView: some View{
        HStack{
            VStack(alignment: .leading,spacing: 5){
                Text("Hello,")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Text("Guest")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Spacer()
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.trailing, 10)
        }
    }
    private var taskTitle: some View{
        HStack{
            Text("Tasks")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Spacer()
            
            NavigationLink{
                NewTaskView()
            }label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 25,height: 25)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(TaskViewModel())
}
