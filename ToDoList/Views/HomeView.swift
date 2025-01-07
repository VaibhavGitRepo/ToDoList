//
//  HomeView.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 05/01/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 20){
                    profileView
                    taskTitle
                    Divider()
                        .frame(height: 1)
                        ForEach(listViewModel.items){item in
                            NavigationLink(destination: TaskDetailView(task: item)) {
                                ListRowView(data: item)
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
        .environmentObject(ListViewModel())
}
