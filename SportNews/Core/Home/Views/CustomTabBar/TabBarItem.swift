//
//  TabBarItem.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import Foundation
import SwiftUI

enum TabBarItem: String, Identifiable, CaseIterable {
  case news
  case mySaved
  case setting
  
  var id: String { rawValue }
  
  @ViewBuilder func buildView() -> some View {
    switch self {
    case .news: News()
    case .mySaved: MySavedView()
    case .setting: SettingView()
    }
  }
  
  var defaultIcon: Image {
    switch self {
    case .news: Image(.newsDefault)
    case .mySaved: Image(.savedDefault)
    case .setting: Image(.settingsDefault)
    }
  }
  
  var activeIcon: Image {
    switch self {
    case .news: Image(.newsActive)
    case .mySaved: Image(.savedActive)
    case .setting: Image(.settingsActive)
    }
  }
}
