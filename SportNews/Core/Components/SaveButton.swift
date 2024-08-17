//
//  SaveButton.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct SaveButton: View {
    let iconName: String = "bookmark"
    
    var body: some View {
        Image(systemName: iconName) // fill if tap
            .font(.title)
            .foregroundStyle(.black)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.layerOne.opacity(0.5))
                )
    }
}


#Preview {
    SaveButton()
}
