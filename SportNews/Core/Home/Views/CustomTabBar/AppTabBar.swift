//
//  AppTabBar.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct AppTabBar: View {
    
    @State private var selection: String = "Home"
    @State private var tabSelection: TabBarItem = .news
    
    var body: some View {
//        defaultTabView
        CustomTabBarContainerView(selection: $tabSelection) {
//            Color.blue
            News()
                .tabBarItem(tab: .news, selection: $tabSelection)
            Spacer()
            
            Color.red.ignoresSafeArea()
                .tabBarItem(tab: .mySaved, selection: $tabSelection)
            
            Color.green.ignoresSafeArea()
                .tabBarItem(tab: .setting, selection: $tabSelection)
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBar()
    }
}

extension AppTabBar {
    
    private var defaultTabView: some View {
        TabView(selection: $selection,
                content:  {
            Color.red
                .tabItem {
                    Image(systemName: "globe")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "bookmark")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "gearshape")
                }
        })
    }
    
}
