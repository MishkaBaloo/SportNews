//
//  Color.swift
//  SportNews
//
//  Created by Michael on 9/19/24.
//

//import Foundation
import SwiftUI


enum AccentColor {
    
    case accentOne
    case accentTwo
    case accentThree
    case accentFour
    
    var color: Color {
        switch self {
        case .accentOne:
            return Color.accentOne
        case .accentTwo:
            return Color.accentTwo
        case .accentThree:
            return Color.accentThree
        case .accentFour:
            return Color.accentFour
        }
    }
}


