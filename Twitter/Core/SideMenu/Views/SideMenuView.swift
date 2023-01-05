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
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuItemRow(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button {
                        print("log out")
                    } label: {
                        SideMenuItemRow(viewModel: viewModel)
                    }

                } else {
                    SideMenuItemRow(viewModel: viewModel)
                }
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
