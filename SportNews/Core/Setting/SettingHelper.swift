//
//  SettingHelper.swift
//  SportNews
//
//  Created by Michael on 11/14/24.
//

import SwiftUI
import StoreKit

enum Settings: Identifiable, CaseIterable {
  case notifications
  case share
  case feedback
  case rateUs
  case privacy
  case termsOfUse
  
  var title: String {
    switch self {
    case .notifications: "Notifications"
    case .share: "Share App"
    case .feedback: "Leave Feedback"
    case .rateUs: "Rate Us"
    case .privacy: "Privacy Policy"
    case .termsOfUse: "Terms of Use"
    }
  }
  
  var id: String { title }
  
  var last: Bool {
    self == .termsOfUse
  }
  
  var action: () {
    switch self {
    case .notifications:
      DispatchQueue.main.async {
        if let urlSettings = URL(string: UIApplication.openSettingsURLString) {
          UIApplication.shared.open(urlSettings)
        }
      }
    case .share:
      guard let urlShare = URL(string: AppConfig.shareAppLink) else { break }
      let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
      DispatchQueue.main.async {
          UIApplication.shared.keyWindow!.rootViewController?.present(activityVC, animated: true, completion: nil)
      }
    case .feedback:
      EmailController.shared.sendEmail(subject: AppConfig.feedbackSubject, body: "", to: AppConfig.leaveFeedbackMail)
    case .rateUs:
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
          SKStoreReviewController.requestReview(in: scene)
        }
      }
    case .privacy:
      if let url = URL(string: AppConfig.privacyPolicyLink) {
        DispatchQueue.main.async {
          UIApplication.shared.open(url)
        }
      }
    case .termsOfUse:
      if let url = URL(string: AppConfig.termsOfUseLink) {
        DispatchQueue.main.async {
          UIApplication.shared.open(url)
        }
      }
    }
  }
}
