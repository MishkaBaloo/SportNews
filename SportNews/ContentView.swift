//
//  ContentView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var tabBarViewModel: TabBarViewmodel = TabBarViewmodel()
    
    @EnvironmentObject private var mySavedVM: MySavedViewModel
    @EnvironmentObject private var newsVM: NewsViewModel
    
    var body: some View {
        
        CustomTabBarContainerView(selection: $tabBarViewModel.selectedTab) {
            News()
                .tabBarItem(tab: .news, selection: $tabBarViewModel.selectedTab)
            MySavedView()
                .tabBarItem(tab: .mySaved, selection: $tabBarViewModel.selectedTab)
            SettingView()
                .tabBarItem(tab: .setting, selection: $tabBarViewModel.selectedTab)
        }
        .preferredColorScheme(.dark)
        .environmentObject(tabBarViewModel)
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
        ContentView()
        .preferredColorScheme(.dark)
        .environmentObject(DeveloperPreview.instance.newsVM)
        .environmentObject(DeveloperPreview.instance.mySavedVM)
}
