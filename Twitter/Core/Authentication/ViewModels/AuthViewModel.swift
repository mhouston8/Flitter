//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Matthew Houston on 1/15/23.
//

import Foundation
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didRegisterNewUser = false
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(self.userSession!)")
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email \(email)")
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = authDataResult?.user else { return }
            self.userSession = user
            
            print("DEBUG: Did log user in: \(self.userSession!.uid)")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        print("DEBUG: Register with email \(email)")
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = authDataResult?.user else { return }
            
            print("DEBUG: Registered user successfully")
            
            let data = [
                "email":email,
                "username": username.lowercased(),
                "fullname":fullname,
                "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { error in
                    self.didRegisterNewUser = true
                    print("Did upload user data.")
                }
        }
    }
    
    func signOut() {
        //sets usersession to nil so we show loginview
        userSession = nil
        
        //signs user out on server
        try? Auth.auth().signOut()
    }
}
