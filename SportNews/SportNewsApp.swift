//
//  SportNewsApp.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

@main
struct SportNewsApp: App {
    
    @StateObject var newsVM = NewsViewModel()
    @StateObject var mySavedVM = MySavedViewModel()
    @AppStorage("hasLaunchedBefore") private var hasLaunchedBefore: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if hasLaunchedBefore {
                                  Welcome(isFirstLaunch: $hasLaunchedBefore)
                                      .onAppear {
                                          hasLaunchedBefore = true 
                                      }
                                      .transition(.move(edge: .top).combined(with: .opacity))
                                      .animation(.easeInOut, value: hasLaunchedBefore)
                              } else {
                                  ContentView()
                              }
            }
            .environmentObject(newsVM)
            .environmentObject(mySavedVM)
        }
    }
}
