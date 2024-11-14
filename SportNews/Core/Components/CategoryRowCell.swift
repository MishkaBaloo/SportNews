//
//  CategoryRowCell.swift
//  SportNews
//
//  Created by Michael on 8/19/24.
//

import SwiftUI

struct CategoryRowCell: View {
    
    var title: String = "All"
    var isSelected: Bool  = false
    
    var body: some View {
        Text(title)
            .setFont(.light, size: 16)
            .fontWeight(isSelected ? .bold : .light)
            .frame(minWidth: 30)
            .padding(.vertical, 12)
            .padding(.horizontal, 14)
            .themeColors(isSelected: isSelected)
            .clipShape(.rect(cornerRadius: 20))
    }
}

extension View {
    
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .layerOne : .backgroudTwo)
            .foregroundStyle(isSelected ? .backgroudOne : .layerTwo)
    }
}
#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 40) {
            CategoryRowCell(title: "Title goes here")
            CategoryRowCell(title: "Title goes here", isSelected: true)
            CategoryRowCell(isSelected: true)
        }
    }
}
