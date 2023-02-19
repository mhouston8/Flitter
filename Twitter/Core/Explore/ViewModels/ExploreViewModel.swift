//
//  ExploreViewModel.swift
//  Twitter
//
//  Created by Matthew Houston on 2/17/23.
//

import Foundation


class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            print("DEBUG: Users are \(users)")
        }
    }
    
}
