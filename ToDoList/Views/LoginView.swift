//
//  LoginView.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 05/01/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    var body: some View{
        NavigationView{
            ScrollView{
                VStack(spacing: 10){
                    Image("login_image_2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 250)
                    Text("Organize your works")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Let's Organize your works with priority ")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 300)
                        .foregroundColor(.gray)
                    Text("and do everthing without stress.")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 300)
                        .foregroundColor(.gray)
                    
                    Input(text: $email, title: "Enter your Email ID")
                    Input(text: $password, title: "Enter your Password", issecureField: true)
                    
                    forgetButton
                    
                    Button{
                        showAlert = true
                    }label: {
                        Text("Log in")
                    }
                    .buttonStyle(CapsuleButton())
                    
                    HStack(spacing:16){
                        line
                        Text("or")
                            .foregroundStyle(.gray)
                        line
                    }
                    
                    Button{
                        showAlert = true
                    }label: {
                        Label("Sign in Using Apple", systemImage:  "apple.logo")
                    }
                    .buttonStyle(CapsuleButton(bgColor: .black))
                    
                    Button{
                        showAlert = true
                    }label: {
                        HStack{
                            Image("google")
                                .resizable()
                                .frame(width: 15,height: 15)
                            Text("Sign in Using Google")
                        }
                    }
                    .buttonStyle(CapsuleButton(textColor: .black,bgColor: .white,hasBorder: true))
                    
                    footer
                }
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea()
            .padding(.horizontal)
            .padding(.vertical, 8)
            .alert("Feature Not Available", isPresented: $showAlert) {}
        }
        .navigationTitle("Sign In")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
    }
    private var forgetButton: some View{
        HStack{
            Spacer()
            Button{
                
            }label: {
                Text("Forget password?")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
    }
    private var line: some View{
        VStack{Divider().frame(height: 1)}
    }
    private var footer: some View{
        HStack{
            Text("Don't have an Account?")
            NavigationLink {
                SignupView()
            }label: {
                Text("Sign Up")
                    .foregroundStyle(.teal)
            }
        }
    }
}

#Preview {
    LoginView()
}
struct CapsuleButton: ButtonStyle{
    var textColor: Color = .white
    var bgColor: Color = .teal
    var hasBorder: Bool = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Capsule().fill(bgColor))
            .scaleEffect(configuration.isPressed ? 0.9 : 1 )
            .overlay{
                hasBorder ? Capsule().stroke(Color.gray, lineWidth: 1) : nil
            }
    }
}
