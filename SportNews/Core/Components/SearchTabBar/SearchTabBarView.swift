//
//  SearchTabBarView.swift
//  SportNews
//
//  Created by Michael on 8/20/24.
//

import SwiftUI

struct SearchTabBarView: View {
    
    @Binding var searchText: String
    @State private var cancel: Bool = false
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass").resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.layerOne)
            
            TextField("Search", text: $searchText)
                .foregroundStyle(.layerOne)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle").resizable()
                        .frame(width: 24, height: 24)
                        .padding()
                        .offset(x: 10) // for tap gesture
                        .foregroundStyle(.layerTwo)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0) // show if search text is != empty
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                }
        }
        .padding()
        .font(.headline)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.layerFive)
        )
        .frame(width: 263, height: 50)
        .padding() // ignores safe area of searchBar
    }
}

#Preview {
    SearchTabBarView(searchText: .constant(""))
        .preferredColorScheme(.dark)
}
