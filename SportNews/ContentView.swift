//
//  ContentView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct ContentView: View {

    @State private var tabSelection: TabBarItem = .news
    
    var body: some View {
        NavigationStack {
            ZStack {
                // background layer
             
                
                
                // conetent layer
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
}


#Preview {
    ContentView()
}
