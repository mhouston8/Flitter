//
//  UserStatsView.swift
//  Twitter
//
//  Created by Matthew Houston on 1/3/23.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack {
            HStack {
                Text("807")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("70.0M")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical)
        
        
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
