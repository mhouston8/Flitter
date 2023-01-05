//
//  SideMenuItemRow.swift
//  Twitter
//
//  Created by Matthew Houston on 1/4/23.
//

import SwiftUI

struct SideMenuItemRow: View {
    
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .bold()
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuItemRow_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuItemRow(viewModel: .profile)
    }
}
