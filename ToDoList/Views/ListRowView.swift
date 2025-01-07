//
//  ListRowView.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 07/01/25.
//

import SwiftUI

struct ListRowView: View {
    @EnvironmentObject private var listViewModel: ListViewModel
    let data: Tasks
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color.gray,lineWidth: 1)
            .frame(width: 370, height: 70)
            .background(Color(.systemGray6))
            .overlay{
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text(data.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .strikethrough(data.isCompleted, color: .black)
                        Text(data.description)
                            .font(.subheadline)
                            .strikethrough(data.isCompleted,color: .black)
                    }
                    Spacer()
                    Button{
                        listViewModel.toggleCompletion(for: data)
                    }label:{
                        Image(systemName: data.isCompleted ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .foregroundColor(data.isCompleted ? Color.blue : Color.gray)
                            .frame(width: 25,height: 25)
                    }
                }
                .padding(.horizontal)
            }
    }
}

#Preview {
    ListRowView(data: Tasks(title: "First", description: "Hii", isCompleted: false))
}
