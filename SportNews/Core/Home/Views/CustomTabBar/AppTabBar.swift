//
//  AppTabBar.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct AppTabBar: View {
    
    @State private var tabSelection: TabBarItem = .news
    
    var body: some View {
        ZStack {
            VStack {
                CustomTabBarContainerView(selection: $tabSelection) {
                    
                    News()
                        .tabBarItem(tab: .news, selection: $tabSelection)
                    
                    MySavedView()
                        .tabBarItem(tab: .mySaved, selection: $tabSelection)
                    
                    SettingView()
                        .tabBarItem(tab: .setting, selection: $tabSelection)
                }
            }
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBar()
    }
}

extension AppTabBar {

    
    
}
