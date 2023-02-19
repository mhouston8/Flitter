//
//  ImageUploader.swift
//  Twitter
//
//  Created by Matthew Houston on 1/22/23.
//

import Foundation
import Firebase
import UIKit


//Helper Class... Sole purpose is to upload images

struct ImageUploader {
    
    static func uploadImage(image: UIImage, imageURL completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { storageMetaData, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
                return
            }
            
            //no error, image saved to storage successfully.
            
            ref.downloadURL { imageURL, error in
                if let error = error {
                    print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
                    return
                }
                
                
                guard let imageURL = imageURL?.absoluteString else { return }
                completion(imageURL)
            }
        }
    }
    
}
