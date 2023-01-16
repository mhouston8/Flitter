//
//  PhotoSelectorView.swift
//  Twitter
//
//  Created by Matthew Houston on 1/16/23.
//

import SwiftUI

struct PhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Create your account",
                           title2: "Add a profile photo")
            
            Button {
                print("Pick image here...")
            } label: {
                Image(systemName: "camera")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.blue)
                    .frame(width: 180, height: 180)
                    .padding(.top, 50)
                    .scaledToFill()
            }

            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectorView()
    }
}
