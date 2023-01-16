//
//  TwitterApp.swift
//  Twitter
//
//  Created by Matthew Houston on 1/1/23.
//

import SwiftUI
import Firebase

@main
struct TwitterApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    //with no app delegate, you can use this
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(viewModel) //any view in the navigation environment can utilize the AuthViewModel without having to initialize it in each view.
        }
    }
}
