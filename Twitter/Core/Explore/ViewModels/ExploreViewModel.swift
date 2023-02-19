//
//  ExploreViewModel.swift
//  Twitter
//
//  Created by Matthew Houston on 2/17/23.
//

import Foundation


class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        let lowercasedQuery = searchText.lowercased()
        
        if searchText.isEmpty {
            return users
        } else {
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
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
