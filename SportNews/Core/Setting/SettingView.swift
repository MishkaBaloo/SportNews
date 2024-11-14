//
//  SettingView.swift
//  SportNews
//
//  Created by Michael on 8/19/24.
//

import SwiftUI
import StoreKit

struct SettingView: View {
    

    @Environment(\.requestReview) var requestReview
    @Environment(\.dismissWindow) var presentationMode
    @EnvironmentObject var tabBarViewModel: TabBarViewmodel
    
    @State private var showAlert: Bool = false
    private let dataService = MySavedDataService()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // background layer
                Image("BG").resizable().ignoresSafeArea()
                
                // content layer
                VStack {
                    header
                    list
                    versionCell
                        .padding()
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SettingView()
        .preferredColorScheme(.dark)
        .environmentObject(TabBarViewmodel())
        .environmentObject(DeveloperPreview.instance.newsVM)
}

extension SettingView {
    
    private var header: some View {
        HStack {
            Text("Settings").foregroundStyle(.accentThree)
                .setFont(.extraBold, size: 36)
                .frame(maxWidth: .infinity, alignment: .leading)
            Button(action: {
                showAlert.toggle() // Оновлюємо таб на новини
            }, label: {
                Image("clearData")
                    .font(.title)
                    .foregroundStyle(.systemOne)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .stroke(.layerOne, lineWidth: 1)
                            .fill(Color.black)
                    )
            })
            .padding(.trailing, 6)
            .alert("Clear Data", isPresented: $showAlert, actions: {
                Button(role: .cancel, action: {}) {
                    Text("Cancel")
                }
                Button(role: .destructive, action: {
                    dataService.clearCache()
                    tabBarViewModel.changeTab(tab: .news)
                    
                }) {
                    Text("Clear")
                }
            }, message: {
                Text("Do you really want to clear the data? Saved articles will be lost.")
            })
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
    
    private var list: some View {
        List(Settings.allCases) { setting in
            HStack {
              Text(setting.title)
                .setFont(.bold, size: 16)
              Spacer()
              Image(.arrowsRight)
                .resizable()
                .frame(width: 25, height: 25)
            }
            .onTapGesture {
              setting.action
            }
        }
        .frame(width: 390, height: 300)
        .scrollContentBackground(.hidden)
        .scrollDisabled(true)
    }
    
    private var versionCell: some View {
        HStack {
            Text("Version")
                .foregroundStyle(.layerTwo)
            +
            Text(" 1.0")
                .foregroundStyle(.accentOne)
        }
        .setFont(.light, size: 18)
    }
}
