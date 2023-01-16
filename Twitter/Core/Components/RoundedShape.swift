//
//  RoundedShape.swift
//  Twitter
//
//  Created by Matthew Houston on 1/10/23.
//

import Foundation
import SwiftUI


//Custom View Modifier that we will have in all projects
struct RoundedShape: Shape {
    
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
    
}
