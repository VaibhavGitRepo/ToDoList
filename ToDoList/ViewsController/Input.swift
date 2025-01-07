//
//  Input.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 06/01/25.
//

import SwiftUI

struct Input: View {
    @Binding var text: String
    var title: String
    var issecureField: Bool = false
    var body: some View {
        if issecureField{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 358,height: 55)
                .overlay{
                    SecureField(title,text: $text)
                        .font(Font.system(size: 16))
                        .foregroundColor(Color.gray)
                        .frame(alignment: .leading)
                        .padding(.horizontal, 10)
                    
                }
        }else{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 358,height: 55)
                .overlay{
                    TextField(title,text: $text)
                        .font(Font.system(size: 16))
                        .foregroundColor(Color.gray)
                        .frame(alignment: .leading)
                        .padding(.horizontal, 10)
                    
                }
        }
    }
}

#Preview {
    Input(text: .constant(""), title: "Title")
}
