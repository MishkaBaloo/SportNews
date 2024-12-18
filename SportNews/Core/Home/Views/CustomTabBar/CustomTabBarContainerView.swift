//
//  CustomTabBarContainerView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct CustomTabBarContainerView<Content:View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
            self._selection = selection
            self.content = content()
        }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
                .padding(.top, 16)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    
    static let tabs: [TabBarItem] = [
        .news, .mySaved, .setting
    ]
    
    static var previews: some View {
         CustomTabBarContainerView(selection: .constant(tabs.first!)) {
             Color.red
         }
     }
 }
