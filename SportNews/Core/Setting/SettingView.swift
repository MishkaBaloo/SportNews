//
//  SettingView.swift
//  SportNews
//
//  Created by Michael on 8/19/24.
//

import SwiftUI
import StoreKit

struct SettingView: View {
    
    @EnvironmentObject private var vm: NewsViewModel
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.requestReview) var requestReview
    @State private var showAlert: Bool = false
    private let privacyPolicyURL = URL(string: "https://policies.google.com/privacy")
    private let termsOfUseURL = URL(string: "https://policies.google.com/terms?hl=en-US#toc-using")
    private let url: String = "https://github.com/MishkaBaloo"
    private let dataService = MySavedDataService()
    
    @State private var showHomeView: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // background layer
                Image("BG").resizable()
                    .ignoresSafeArea()
                
                // content layer
                VStack {
                    header
                    List {
                        notifications
                        if URL(string: url) != nil {
                            shareApp
                        }
                        leaveFeedback
                        rateUse
                        privacypolicy
                        termsofuse
                    }
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                }
                versionCell
            }
            .navigationDestination(isPresented: $showHomeView, destination: {
                News()
            })
        }
    }
    
    private var header: some View {
        HStack {
            Text("Settings").foregroundStyle(.accentThree)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 36, weight: .bold))
            
            Button(action: {
                showAlert.toggle()
            }, label: {
                Image(systemName: "trash")
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
                }) {
                    Text("Clear")
                }
            }, message: {
                Text("Do you really want to clear the data?Saved articles will be lost.")
            })
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 4)
        .padding(.horizontal, 16)
    }
}

#Preview {
    SettingView()
        .preferredColorScheme(.dark)
        .environmentObject(DeveloperPreview.instance.newsVM)
}

//MARK: ListItems

extension SettingView {
    private var notifications: some View {
        VStack {
            NavigationLink(destination: NotificationsView()) {
                HStack {
                    Text("Notifications")
                        .foregroundStyle(.layerOne)
                        .font(.headline)
                }
            }
        }
        .foregroundStyle(.layerOne)
        .font(.headline)
        .listRowBackground(Color.backgroudTwo)
    }
    
    private var shareApp: some View {
        
        ShareLink(item: url) {
            HStack {
                Text("Share App")
                    .foregroundStyle(.layerOne)
                    .font(.headline)
                Image(systemName: "chevron.right")
                    .fontWeight(.medium)
                    .foregroundStyle(.layerTwo)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .listRowBackground(Color.backgroudTwo)
    }
    
    private var leaveFeedback: some View {
        
        Button(action: {
            
        }, label: {
            HStack {
                Text("Leave Feedback")
                    .foregroundStyle(.layerOne)
                    .font(.headline)
                Image(systemName: "chevron.right")
                    .fontWeight(.medium)
                    .foregroundStyle(.layerTwo)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        })
        .listRowBackground(Color.backgroudTwo)
    }
    
    private var rateUse: some View {
        HStack {
            Text("Rate Use")
                .foregroundStyle(.layerOne)
                .font(.headline)
            Image(systemName: "chevron.right")
                .fontWeight(.medium)
                .foregroundStyle(.layerTwo)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .onTapGesture {
            requestReview()
        }
        .listRowBackground(Color.backgroudTwo)
    }
    
    private var privacypolicy: some View {
        
        HStack {
            Link("Privacy Policy", destination: privacyPolicyURL!)
            Spacer()
            Image(systemName: "chevron.right")
                .fontWeight(.medium)
                .foregroundStyle(.layerTwo)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .foregroundStyle(.layerOne)
        .font(.headline)
        .listRowBackground(Color.backgroudTwo)
    }
    
    private var termsofuse: some View {
        
        HStack {
            Link("Terms of Use", destination: termsOfUseURL!)
            Spacer()
            Image(systemName: "chevron.right")
                .fontWeight(.medium)
                .foregroundStyle(.layerTwo)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .foregroundStyle(.layerOne)
        .font(.headline)
        .listRowBackground(Color.backgroudTwo)
    }
    
    private var versionCell: some View {
        HStack {
            Text("Version")
                .foregroundStyle(.layerTwo)
                .font(.system(size: 16, weight: .light))
            +
            Text(" 1.0")
                .foregroundStyle(.accentOne)
                .font(.system(size: 16, weight: .light))
        }
    }
}
