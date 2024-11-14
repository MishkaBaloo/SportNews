//
//  TabBarViewModel.swift
//  SportNews
//
//  Created by Michael on 11/14/24.
//

import Foundation

class TabBarViewmodel: ObservableObject {
  @Published var searchModeOn: Bool = false
  @Published var selectedTab: TabBarItem = .news
  
  public func changeTab(tab: TabBarItem) {
    self.selectedTab = tab
  }
}
