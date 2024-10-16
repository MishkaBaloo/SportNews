//
//  Welcome.swift
//  SportNews
//
//  Created by Michael on 9/3/24.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        ZStack {
            // backgroundLayer
            Color.accentThree.ignoresSafeArea()
            
            
            // content layer
            VStack {

                    Text("Sports News \n from Around the \n World for You")
                    .foregroundColor(.backgroudOne)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 40, weight: .semibold))
                        .padding(.top, 16)

                
                    Image("Online activism")
                
                VStack {
                    Text("The best time to read is when you \n read fast and about everything. \n With us, you will be kept up to \n date with the latest and fastest \n sports news.")
                    .lineSpacing(4)
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(.backgroudOne)
                    .multilineTextAlignment(.center)
                    .frame(width: 289, height: 128)
                }
                .padding(.top, 16)
                
                Spacer()
                
                VStack {
                    Button {
                        
                    } label: {
                        Text("Swipe Up")
                            .foregroundStyle(.backgroudOne)
                            .font(.system(size: 16, weight: .bold))
                            
                    }
                }

                
                
            }
            
        }
    }
}

#Preview {
    Welcome()
}
