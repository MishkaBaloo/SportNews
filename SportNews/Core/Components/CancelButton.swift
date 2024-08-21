//
//  CancelButton.swift
//  SportNews
//
//  Created by Michael on 8/21/24.
//

import SwiftUI

struct CancelButton: View {
    let iconName: String = "Cancel"
    
    var body: some View {
        Text(iconName)
            .frame(width: 80, height: 50, alignment: .leading)
            .foregroundStyle(.systemOne)
            .font(.system(size: 18, weight: .bold))
        //            .padding(.trailing, 16)
    }
}

#Preview {
    CancelButton()
        .preferredColorScheme(.dark)
}
