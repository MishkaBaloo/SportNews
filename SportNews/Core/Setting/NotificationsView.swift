//
//  NotificationsView.swift
//  SportNews
//
//  Created by Michael on 8/24/24.
//

import SwiftUI

struct NotificationsView: View {
    
    let settings = ["Schedulede Summury", "Show Previews", "Screen Sharing"]
    
    let apps = ["SportsNews", "CryptoTracker", "AppClicker", "XCode", "Figma", "Instagram", "Safari", "Discord"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("BG").resizable()
                .ignoresSafeArea()
                
                VStack {
                    List {
                        displayAs
                        settingsCell
                        siri
                        appSections
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Notifications")
                }
            }
        }
    }
    
    private var displayAs: some View {
        Section {
            Image("IMG_3815").resizable()
                .frame(height: 130)
                .foregroundStyle(.clear)
        } header: {
            Text("display as")
        }
    }
    
    private var settingsCell: some View {
        Section {
            ForEach(settings, id: \.self) { setting in
                NavigationLink(value: setting) {
                    Text(setting)
                }
            }
        }
    }
    
    private var siri: some View {
        Section {
            HStack {
                Text("Sirri Suggestions")
                Image(systemName: "chevron.right")
                    .fontWeight(.medium)
                    .foregroundStyle(.layerTwo)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            
            
        } header: {
            Text("siri")
        }
    }
    
    private var appSections: some View {
        Section {
            
            ForEach(apps, id: \.self) { app in
                NavigationLink(value: app) {
                    Text(app)
                }
            }
            
        } header: {
            Text("notification style")
        }
    }
}

#Preview {
    NotificationsView()
        .preferredColorScheme(.dark)
}
