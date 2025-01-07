//
//  ProfileView.swift
//  ToDoList
//
//  Created by Vaibhav Sharma on 05/01/25.
//

import SwiftUI

struct ProfileView: View {

    var body: some View {
            NavigationView {
                ScrollView {
                    VStack(spacing: 16){
                        VStack(spacing: 10) {
                            Spacer()
                            Image(systemName: "person.crop.circle.fill")
                                .font(.title)
                                .fontWeight(.semibold)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                                .background(Color(.systemGray5))
                                .clipShape(Circle())

                            Text("Guest")
                                .font(.title)
                                .fontWeight(.bold)

                            Text("guest@gmail.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(spacing: 5) {
                            
                            ProfileOptionRow(icon: "person", title: "Account Details")
                            Divider()
                            ProfileOptionRow(icon: "gear", title: "Settings")
                            Divider()
                            ProfileOptionRow(icon: "bell", title: "Tasks History")
                            Divider()
                            ProfileOptionRow(icon: "lock", title: "Privacy")
                            Divider()
                            ProfileOptionRow(icon: "questionmark.circle", title: "Help & Support")
                        }
                        .background(Color(.systemBackground))
                        .cornerRadius(15)
                        .shadow(color: Color(.systemGray4), radius: 5, x: 0, y: 2)
                        .padding(.horizontal, 20)

                        //Spacer()
                        VStack(spacing: 5){
                            NavigationLink{
                                LoginView()
                            }label:{
                                ProfileOptionRow(icon: "arrow.right.circle", title: "Sign In")
                            }
                            Divider()
                            NavigationLink{
                                SignupView()
                            }label:{
                                ProfileOptionRow(icon: "person.badge.plus", title: "Create Account")
                            }
                        }
                        .background(Color(.systemBackground))
                        .cornerRadius(15)
                        .shadow(color: Color(.systemGray4), radius: 5, x: 0, y: 2)
                        .padding(.horizontal, 20)
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
                .navigationTitle("Profile")
                .toolbarRole(.editor)
                .navigationBarTitleDisplayMode(.inline)
            }
    }
}

struct ProfileOptionRow: View {
    var icon: String
    var title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 30, height: 30)

            Text(title)
                .font(.system(size: 18))
                .foregroundColor(.primary)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .cornerRadius(10)
    }
}

#Preview {
    ProfileView()
}
