//
//  TweetsRowView.swift
//  Twitter
//
//  Created by Matthew Houston on 1/1/23.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            //Profile Image + User Info + Tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color.blue)
                
                //user info
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline)
                            .bold()
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("49m")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .fontWeight(.thin)
                    }
                    
                    //tweet caption
                    Text("I believe in Harvey Dent.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            
            //action buttons
            HStack {
                Button {
                    //action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button {
                    //action
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button {
                    //action
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button {
                    //action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

            }
            .padding()
            
            Divider()
        }
    }
}

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
