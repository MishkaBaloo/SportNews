//
//  SettingView.swift
//  SportNews
//
//  Created by Michael on 8/19/24.
//

import SwiftUI

struct SettingView: View {
    
//    let privacyPolicy = URL(string: "https://policies.google.com/privacy")
//    let termsOfUse = URL(string: "https://policies.google.com/terms?hl=en-US#toc-using")
    
    
    var body: some View {
//        ZStack {
            
            // background layer
//            Image("BG").ignoresSafeArea()
            // content layer
            VStack {
                
                header
                List {
                    
                    notifications
                    shareApp
                    leaveFeedback
                    rateUse
                    privacypolicy
                    termsofuse
                    
                }
                .scrollContentBackground(.hidden)
                .frame(width: 353, height: 310)

            }
//        }
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

//MARK: ListItems

extension SettingView {
    private var notifications: some View {
        
        Button(action: {
            
        }, label: {
            HStack {
                Text("Notifications")
                
                Image(systemName: "chevron.right")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .foregroundStyle(.layerOne)
            .font(.headline)
        })
//        .listRowBackground(Color.backgroudTwo)
    }

    private var shareApp: some View {
        
        Button(action: {
            
        }, label: {
            HStack {
                Text("Share App")
                
                Image(systemName: "chevron.right")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .foregroundStyle(.layerOne)
            .font(.headline)
        })
//        .listRowBackground(Color.backgroudTwo)
    }

    private var leaveFeedback: some View {
        
        Button(action: {
            
        }, label: {
            HStack {
                Text("Leave Feedback")
                
                Image(systemName: "chevron.right")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .foregroundStyle(.layerOne)
            .font(.headline)
        })
//        .listRowBackground(Color.backgroudTwo)
    }

    private var rateUse: some View {
        
        Button(action: {
            
        }, label: {
            HStack {
                Text("Rate Use")
                
                Image(systemName: "chevron.right")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .foregroundStyle(.layerOne)
            .font(.headline)
        })
//        .listRowBackground(Color.backgroudTwo)
    }

    private var privacypolicy: some View {
        
        Button(action: {
            
        }, label: {
            HStack {
                Text("Privacy Policy")
                
                Image(systemName: "chevron.right")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .foregroundStyle(.layerOne)
            .font(.headline)
        })
//        .listRowBackground(Color.backgroudTwo)
    }

    private var termsofuse: some View {
        
        Button(action: {
            
        }, label: {
            HStack {
                Text("Terms of Use")
                
                Image(systemName: "chevron.right")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .foregroundStyle(.layerOne)
            .font(.headline)
        })
//        .listRowBackground(Color.backgroudTwo)
    }
}
