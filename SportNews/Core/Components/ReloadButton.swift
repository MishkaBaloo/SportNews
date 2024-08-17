//
//  ReloadButton.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct ReloadButton: View {
    let iconName: String = "arrow.clockwise"
    
    var body: some View {
        Image(systemName: iconName)// rotation effect + vibrations
            .font(.title)
            .foregroundStyle(.layerOne)
            .frame(width: 50, height: 50)
            .padding(.bottom, 3)
            .background(
                Circle()
                    .stroke(.layerOne, lineWidth: 1)
                    .fill(Color.black)
                )
    }
}

#Preview {
    ReloadButton()
}
