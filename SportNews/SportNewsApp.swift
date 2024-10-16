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
    
    @State private var showLaunchView: Bool = true
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
//                ContentView()
                Coordinator_View()
            }
            .environmentObject(newsVM)
            .environmentObject(mySavedVM)
            
//            ZStack {
//                if showLaunchView {
//                    LaunchView(showLaunchView: $showLaunchView)
//                        .transition(.move(edge: .bottom))
//                }
//            }
//            .zIndex(2.0)
        }
    }
}
