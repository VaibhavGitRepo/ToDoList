//
//  SignupView.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 05/01/25.
//

import SwiftUI

struct SignupView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack(spacing: 16){
                Input(text: $name, title: "Enter your Full Name")
                Input(text: $email, title: "Enter your Email")
                Input(text: $password, title: "Enter your Password",issecureField: true)
                ZStack(alignment: .trailing){
                    Input(text: $confirmPassword, title: "Confirm your Password", issecureField: true)
                    if !password.isEmpty && !confirmPassword.isEmpty{
                        Image(systemName: "\(isvalidPassword ? "checkmark" : "xmark").circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(isvalidPassword ? Color(.systemGreen) : Color(.systemRed))
                    }
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Create Account")
                }
                .buttonStyle(CapsuleButton())
            }
        }
        .navigationTitle("Sign up your Account")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
        .padding(.horizontal)
        .padding(.vertical,10)
    }
    var isvalidPassword: Bool {
        password==confirmPassword
    }
}

#Preview {
    SignupView()
}
