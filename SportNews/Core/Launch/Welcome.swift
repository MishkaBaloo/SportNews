//
//  Welcome.swift
//  SportNews
//
//  Created by Michael on 9/3/24.
//

import SwiftUI

struct Welcome: View {
    
    @Binding var isFirstLaunch: Bool
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.accentThree.ignoresSafeArea()
            
            VStack(alignment: .center) {
                Text("Sports News from Around the World for You")
                    .setFont(.extraBold, size: 40)
                    .foregroundColor(.backgroudOne)
                    .multilineTextAlignment(.center)
                    .padding(.top, 16)
                
                Image("Online activism")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.79,
                           height: UIScreen.main.bounds.height * 0.34)
                
                VStack {
                    Text("The best time to read is when you read fast and about everything. With us, you will be kept up to date with the latest and fastest sports news.")
                        .lineSpacing(10)
                        .setFont(.news, size: 18)
                        .foregroundColor(.backgroudOne)
                        .multilineTextAlignment(.center)
                        .frame(width: 289, height: 128)
                }
                .padding(.top, 20)
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isAnimating = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isFirstLaunch = true
                    }
                } label: {
                    Text("Swipe Up")
                        .foregroundStyle(.backgroudOne)
                        .setFont(.bold, size: 18)
                }
                .padding()
            }
        }
        .offset(y: isAnimating ? -UIScreen.main.bounds.height : 0)
        .opacity(isAnimating ? 0 : 1)
    }
}

#Preview {
    Welcome(isFirstLaunch: .constant(true))
}
