//
//  LaunchView.swift
//  SportNews
//
//  Created by Michael on 10/4/24.
//

import SwiftUI

struct LaunchView: View {
    
    
    @State private var loadingText: [String] = "Loading portfolio...".map { String($0) }
    @State private var loops: Int  = 0
    @State private var showLoadingText: Bool  = false
    @State private var counter: Int = 0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .ignoresSafeArea()
            
            Image("ImageNewsSmallDefault")
                .resizable()
                .frame(width: 123, height: 123)
            
            ZStack {
                
                if showLoadingText {
                    
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices, id: \.self) { index in
                            Text(loadingText[index])
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.layerOne)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    
                    //                    VStack(spacing: 0) {
                    //                        Image("loading")
                    //                            .rotationEffect(.degrees(angle))
                    //                            .onAppear(perform: {
                    //                                startRotation()
                    //                            })
                    //                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        
        .onAppear {
            showLoadingText.toggle()
        }
        
        .onReceive(timer, perform: { _ in
            withAnimation(.spring) {
                
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunchView = false
                    }
                    
                } else {
                    counter += 1
                }
            }
        })
        
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
