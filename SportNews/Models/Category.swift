//
//  Category.swift
//  SportNews
//
//  Created by Michael on 8/19/24.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable {
    case soccer = "⚽️Soccer"
    case basketball = "🏀Basketball"
    case baseball = "⚾️Baseball"
    case cricket = "🏏Cricket"
    case amFootball = "🏈Am. Football"
    case volleyball = "🏐Voleyball"
    case tennis = "🎾Tennis"
    case iceHokey = "🏒Ice Hokey"
    case rugby = "🏉Rugby"
    case boxing = "🥊Boxing"
    case golf = "⛳️Golf"
    
    var keyword: String {
        switch self {
        case .soccer:
            "soccer"
        case .basketball:
            "basketball"
        case .baseball:
            "baseball"
        case .cricket:
            "cricket"
        case .amFootball:
            "football"
        case .volleyball:
            "volleyball"
        case .tennis:
            "tennis"
        case .iceHokey:
            "hokey"
        case .rugby:
            "rugby"
        case .boxing:
            "boxing"
        case .golf:
            "golf"
        }
    }
}
