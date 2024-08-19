//
//  SettingView.swift
//  SportNews
//
//  Created by Michael on 8/19/24.
//

import SwiftUI

struct SettingView: View {
    
    let privacyPolicy = URL(string: "https://policies.google.com/privacy")
    let termsOfUse = URL(string: "https://policies.google.com/terms?hl=en-US#toc-using")
    
    @State private var visibility: NavigationSplitViewVisibility = .all
    @State private var selectedCategory: SettingList? = nil
    
    var body: some View {
        ZStack {
            
            // background layer
            
            
            // content layer
            VStack {
                header
                
                List {
                    HStack {
                        Text("Notifications")
                        
                        Image(systemName: "chevron.right")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .onTapGesture {
                        
                    }
                    
                    HStack {
                        Text("Notifications")
                        
                        Image(systemName: "chevron.right")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .onTapGesture {
                        
                    }
                    
                    HStack {
                        Text("Notifications")
                        
                        Image(systemName: "chevron.right")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .onTapGesture {
                        
                    }
                    
                    HStack {
                        Text("Notifications")
                        
                        Image(systemName: "chevron.right")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .onTapGesture {
                        
                    }
                    
                    HStack {
                        Text("Notifications")
                        
                        Image(systemName: "chevron.right")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .onTapGesture {
                        
                    }
                    
                    HStack {
                        Text("Notifications")
                        
                        Image(systemName: "chevron.right")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .onTapGesture {
                        
                    }
                    
                }
            }
        }
    }
}

private var header: some View {
    HStack(spacing: 8) {
        HStack {
            Text("Settings").foregroundStyle(.accentThree)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 36, weight: .bold))
            
            ClearButton()
                .onTapGesture {
                    
                }
                .padding(.trailing, 8)
        }
    }
    .padding(.vertical, 4)
    .padding(.horizontal, 16)
}

#Preview {
    SettingView()
        .preferredColorScheme(.dark)
}

