//
//  TabBarItem.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case  news, mySaved, setting
    
    var iconName: String {
        switch self {
        case .news: return "globe"
        case .mySaved: return "bookmark"
        case .setting: return "gearshape"
        }
    }
    
    var color: Color {
        switch self {
        case .news: return Color.white
        case .mySaved: return Color.white
        case .setting: return Color.white
        }
    }
    
    
}
