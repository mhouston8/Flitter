//
//  PhotoSelectorView.swift
//  Twitter
//
//  Created by Matthew Houston on 1/16/23.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct PhotoSelectorView: View {
    
    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var profileImage: Image?
    @State private var profileImageUIImageRepresentation: UIImage?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup account",
                           title2: "Add a profile photo")
            
            
            PhotosPicker(
                selection: $selectedImage,
                matching: .images,
                photoLibrary: .shared()) {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .profileImageViewModifier()
                    } else {
                        Image(systemName: "camera")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color.blue)
                            .frame(width: 100, height: 100)
                            .padding(.top, 200)
                            .scaledToFill()
                    }
            }
            .onChange(of: selectedImage) { newValue in
                Task {
                    if let imageData = try? await newValue?.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                        self.profileImageUIImageRepresentation = image
                        let i = Image(uiImage: image)
                        self.profileImage = Image(uiImage: image)
                    }
                }
            }
            
            if let profileImageUIImageRepresentation = profileImageUIImageRepresentation {
                Button {
                    viewModel.uploadProfileImage(profileImageUIImageRepresentation)
                   print("DEBUG: Finish registering user...")
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func profileImageViewModifier() -> some View {
        self
            .frame(width: 100, height: 100)
            .padding(.top, 200)
//            .scaledToFill()
            //.clipShape(Circle())
    }
}

private struct ProfileImageViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.blue)
            .frame(width: 100, height: 100)
            .padding(.top, 200)
            .scaledToFill()
            //.clipShape(Circle())
    }
}

@available(iOS 16.0, *)
struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectorView()
    }
}
