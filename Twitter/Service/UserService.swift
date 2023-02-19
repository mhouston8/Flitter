//
//  UserService.swift
//  Twitter
//
//  Created by Matthew Houston on 1/24/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct UserService {
    
    func fetchUser(withUID uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                
                if let error = error {
                    print("There was an error in fetchUser method: \(error.localizedDescription)")
                }
                
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap({ try? $0.data(as: User.self)})
                completion(users)
            }
    }
}
