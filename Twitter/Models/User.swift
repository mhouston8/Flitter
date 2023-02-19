//
//  User.swift
//  Twitter
//
//  Created by Matthew Houston on 1/28/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable, Hashable { //identifiable protocol is used so that firebas can utilize decodable
    
    @DocumentID var id: String? //this will read the document's id in the db and store that in this id property.
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
}
