//
//  GoToSourceButton.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct GoToSourceButton: View {
    
    let iconName: String = "shazam.logo"
    
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
    GoToSourceButton()
}
