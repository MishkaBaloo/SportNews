//
//  AppConfig.swift
//  SportNews
//
//  Created by Michael on 11/14/24.
//

import Foundation


enum AppConfig {
    static var articlesPerPageDownloaded: Int {
    #if DEV
    10
    #else
    20
    #endif
  }
  static let termsOfUseLink = "https://www.google.com/"
  static let privacyPolicyLink = "https://www.google.com/"
  static let shareAppLink = "https://www.google.com/"
  
  static let leaveFeedbackMail = "123@gmail.com"
  static let feedbackSubject = "Feedback"
  
  static var hoursForComeBackNotification: Double {
   #if DEV
    0.5
   #else
    24
   #endif
  }
}
