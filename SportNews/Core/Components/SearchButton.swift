//
//  SearchButton.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct SearchButton: View {
    let iconName: String = "searchButton"
    
    var body: some View {
        Image( iconName)// rotation effect + vibrations
            .font(.title)
            .foregroundStyle(.layerOne)
            .frame(width: 50, height: 50)
            .padding(.top, 1)
            .background(
                Circle()
                    .stroke(.layerOne, lineWidth: 1)
                    .fill(Color.black)
                )
    }
}

#Preview {
    SearchButton()
}
