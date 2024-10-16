//
//  TabbarView.swift
//  SportNews
//
//  Created by Michael on 10/10/24.
//

import SwiftUI

struct TabbarView: View {
    
    @State private var tabSelection: TabBarItem = .news
    
    var body: some View {
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

#Preview {
    TabbarView()
}
