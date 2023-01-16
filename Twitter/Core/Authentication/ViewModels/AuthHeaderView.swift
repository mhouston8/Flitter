//
//  AuthHeaderView.swift
//  Twitter
//
//  Created by Matthew Houston on 1/12/23.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let title1: String
    let title2: String
    
    var body: some View {
        //top blue header
        VStack(alignment: .leading) {
            HStack { Spacer() } //trick to make the vstack fill the width of the screen.
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        //.frame(width: UIScreen.main.bounds.width)
        .frame(height: 260)
        .padding(.leading)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello", title2: "Welcome Back")
    }
}
