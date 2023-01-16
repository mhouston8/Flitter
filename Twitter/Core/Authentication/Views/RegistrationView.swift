//
//  RegistrationView.swift
//  Twitter
//
//  Created by Matthew Houston on 1/6/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var navigateToPhotoSelectorScreen = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack {
            AuthHeaderView(title1: "Get Started.", title2: "Create your account.")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $email)
                CustomInputField(imageName: "person",
                                 placeholderText: "Username",
                                 text: $username)
                CustomInputField(imageName: "person",
                                 placeholderText: "Full Name",
                                 text: $fullName)
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
                
            }
            .padding(32)
            NavigationLink(destination: PhotoSelectorView(), isActive: $navigateToPhotoSelectorScreen) {
                Text("")
            }
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullName, username: username)
                self.navigateToPhotoSelectorScreen = true
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color.blue)

        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    
    static var previews: some View {
        RegistrationView()
    }
}
