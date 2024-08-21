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
        //        NavigationStack {
        ZStack {
            // background layer
            Image("BG").ignoresSafeArea()
            
            
            // conetent layer
            VStack {
                CustomTabBarContainerView(selection: $tabSelection) {
                    
                    News()
                        .environmentObject(DeveloperPreview.instance.newsVM)
                        .tabBarItem(tab: .news, selection: $tabSelection)
                    
                    MySavedView()
                        .environmentObject(DeveloperPreview.instance.mySavedVM)
                        .tabBarItem(tab: .mySaved, selection: $tabSelection)
                    
                    SettingView()
                        .tabBarItem(tab: .setting, selection: $tabSelection)
                }
            }
            
        }
    }
}

#Preview {
    NavigationView(content: {
        ContentView()
            .preferredColorScheme(.dark)
    })
    .environmentObject(DeveloperPreview.instance.newsVM)
    .environmentObject(DeveloperPreview.instance.mySavedVM)
}
