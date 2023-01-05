//
//  SideMenuView.swift
//  Twitter
//
//  Created by Matthew Houston on 1/3/23.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 58)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.headline)
                    Text("Batman")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { item in
                HStack(spacing: 16) {
                    Image(systemName: item.imageName)
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(item.title)
                        .bold()
                        .font(.subheadline)
                    
                    Spacer()
                }
                .frame(height: 40)
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
