//
//  ClearButton.swift
//  SportNews
//
//  Created by Michael on 8/19/24.
//

import SwiftUI

struct ClearButton: View {
    let iconName: String = "trash"
    
    var body: some View {
        Image(systemName: iconName)// rotation effect + vibrations
            .font(.title)
            .foregroundStyle(.systemOne)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .stroke(.layerOne, lineWidth: 1)
                    .fill(Color.black)
                )
    }
}

#Preview {
    ClearButton()
}
