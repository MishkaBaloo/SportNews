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
    
//    @EnvironmentObject private var vm: SettingViewModel
    
    let privacyPolicyURL = URL(string: "https://policies.google.com/privacy")
    let termsOfUseURL = URL(string: "https://policies.google.com/terms?hl=en-US#toc-using")
    let url: String = "https://github.com/MishkaBaloo"
    
    @State private var showRequestReview: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // background layer
                Image("BG").resizable()
                .ignoresSafeArea()
                
                // content layer
                VStack {
                    
    //                Spacer(minLength: 0)
                    
                    header
                    
                    List {
                        notifications
                        
                        // share app
                        if let url =  URL(string: url) {
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
                        }
                        
                        leaveFeedback
                        
                        rateUse
                            .onTapGesture {
                                requestReview()
                            }
                        
                        privacypolicy // link
                        termsofuse // link
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

private var header: some View {
    HStack {
        HStack {
            Text("Settings").foregroundStyle(.accentThree)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 36, weight: .bold))
            
            ClearButton()
                .onTapGesture {
        
                }
                .padding(.trailing, 6)
        }
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 4)
    .padding(.horizontal, 16)
}

#Preview {
    SettingView()
        .preferredColorScheme(.dark)
}

//MARK: ListItems

extension SettingView {
    private var notifications: some View {
        NavigationLink("Notifications") {
            NotificationsView()
        }
        .foregroundStyle(.layerOne)
        .font(.headline)
//        .listRowBackground(Color.backgroudTwo)
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
//        .listRowBackground(Color.backgroudTwo)
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
//        .listRowBackground(Color.backgroudTwo)
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
//        .listRowBackground(Color.backgroudTwo)
    }
}
