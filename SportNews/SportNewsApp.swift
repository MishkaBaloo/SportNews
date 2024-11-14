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
                    ContentView()
                } else {
                    Welcome(isFirstLaunch: $hasLaunchedBefore)
                }
            }
            .environmentObject(newsVM)
            .environmentObject(mySavedVM)
        }
    }
}
