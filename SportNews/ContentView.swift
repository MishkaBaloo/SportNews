//
//  ContentView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var mySavedVM: MySavedViewModel
    @EnvironmentObject private var newsVM: NewsViewModel
    
    @StateObject private var coordinator = Coordinator()
    @State private var tabSelection: TabBarItem = .news
    
    var body: some View {
        
        CustomTabBarContainerView(selection: $tabSelection) {
            
            News()
                .tabBarItem(tab: .news, selection: $tabSelection)
            
            MySavedView()
                .tabBarItem(tab: .mySaved, selection: $tabSelection)
            
            SettingView()
                .tabBarItem(tab: .setting, selection: $tabSelection)
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
        ContentView()
        .preferredColorScheme(.dark)
        .environmentObject(DeveloperPreview.instance.newsVM)
        .environmentObject(DeveloperPreview.instance.mySavedVM)
}
