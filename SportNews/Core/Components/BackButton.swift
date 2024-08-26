//
//  BackButton.swift
//  SportNews
//
//  Created by Michael on 8/26/24.
//

import SwiftUI

struct BackButton: View {
    
    let iconName: String = "chevron.left"
    
    var body: some View {
        Image(systemName: iconName)
            .font(.title)
            .foregroundStyle(.black)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.white.opacity(0.5))
            )
        
        
    }
}

#Preview {
    BackButton()
}