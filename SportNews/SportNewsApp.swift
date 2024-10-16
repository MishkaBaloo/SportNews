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
                ContentView()
            }
            .environmentObject(newsVM)
            .environmentObject(mySavedVM)
        }
    }
}
