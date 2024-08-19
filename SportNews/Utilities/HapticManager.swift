//
//  HapticManager.swift
//  SportNews
//
//  Created by Michael on 8/19/24.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator  = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
