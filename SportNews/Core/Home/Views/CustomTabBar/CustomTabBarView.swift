//
//  CustomTabBarView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
        
        tabBar
            .onChange(of: selection) { oldValue, newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

struct CustomTabbarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .news, .mySaved, .setting
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

extension CustomTabBarView {
    
//    private func tabView2(tab: TabBarItem) -> some View {
//        VStack {
//            Image(systemName: tab.iconName).font(.system(.title, weight: .semibold))
//                .foregroundStyle(localSelection == tab ? .backgroudOne : .layerOne) // .backgroudOne if selected
//                .frame(width: 60, height: 60)
//                .background(
//                Circle()
//                    .foregroundStyle(localSelection == tab ? .layerOne :.layerThree) // .layerOne if selected
//                )
//            
//        }
//        .padding(.horizontal, 3)
//    }
    
    private var tabBar: some View {
      Image(.tabBar)
        .resizable()
        .frame(width: 216, height: 68)
        .overlay(
          HStack(spacing: 14) {
            ForEach(tabs) { tab in
              ZStack {
                Circle()
                  .frame(width: 60, height: 60)
                  .foregroundColor(localSelection == tab ? .layerOne : .layerThree)
                
                getTabImage(for: tab)
              }
            }
          }
        )
    }
    
    @ViewBuilder private func getTabImage(for tab: TabBarItem) -> some View {
      (localSelection == tab ? tab.activeIcon : tab.defaultIcon)
        .resizable()
        .frame(width: 32, height: 32)
        .padding(14)
        .onTapGesture {
          switchToTab(tab: tab)
        }
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
}
