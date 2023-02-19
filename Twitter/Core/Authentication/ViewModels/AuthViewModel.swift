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
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
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
            self.fetchUser()
            
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
            self.tempUserSession = user
            
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
    
    func uploadProfileImage(_ image: UIImage) {
        guard let userUID = tempUserSession?.uid else { return }
        ImageUploader.uploadImage(image: image) { profileImageURL in
            Firestore.firestore().collection("users")
                .document(userUID)
                .updateData(["profileImageUrl" : profileImageURL]) { error in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        service.fetchUser(withUID: uid) { user in
            self.currentUser = user
        }
    }
}
