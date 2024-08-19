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
        
        tabBarversionOne
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
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName).font(.system(.title, weight: .semibold))
                .foregroundStyle(localSelection == tab ? .backgroudOne : .layerOne) // .backgroudOne if selected
                .frame(width: 60, height: 61)
                .background(
                Circle()
                    .foregroundStyle(localSelection == tab ? .layerOne :.layerThree) // .layerOne if selected
                )
        }
        .padding(.horizontal, 3)
        .padding(.bottom, 8)
    }
    
    private var tabBarversionOne: some View {
        HStack(alignment: .center) {
            ForEach(tabs,id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .background(
           Image("TabBar")
        )
        .padding()
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
}

extension CustomTabBarView {
    
    private func tabView2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName).font(.system(.title, weight: .semibold))
                .foregroundStyle(localSelection == tab ? .backgroudOne : .layerOne) // .backgroudOne if selected
                .frame(width: 60, height: 60)
                .background(
                    ZStack {
                        if localSelection == tab {
                            RoundedRectangle(cornerRadius: 10.0)
                                .fill(.backgroudOne.opacity(0.2))
                                .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                        }
                    }
                )
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(Color.backgroudTwo)
        .clipShape(Circle())
    }
    
    
    private var tabBarversionTwo: some View {
        HStack {
            ForEach(tabs,id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(
            Capsule()
            .foregroundStyle(.backgroudOne.opacity(0.5))
        )
        .padding()
    }
}

