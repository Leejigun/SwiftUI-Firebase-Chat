//
//  LoginView.swift
//  LBTASwiftuiFirebaseChat
//
//  Created by bimo.ez on 2021/10/29.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLoginMode = true
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack {
                    Picker(selection: $isLoginMode, label: Text("Picker Here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    if !isLoginMode {
                        Image(systemName: "person.fill")
                            .font(.system(size: 64))
                            .padding()
                            .foregroundColor(Color.blue)
                    }
                    
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)
                    
                    Button(action: {
                        handleAction()
                    }, label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }
                        .background(Color.blue)
                    })
                }
                .padding()
            }
            .navigationTitle(
                isLoginMode ? "Log In" : "Create Account"
            )
            .background(
                Color.init(white: 0, opacity: 0.05)
                    .ignoresSafeArea()
            )
        }
    }
    
    private func handleAction() {
        if isLoginMode {
            print("Should login firebase")
        } else {
            print("Should sign up firebase")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
