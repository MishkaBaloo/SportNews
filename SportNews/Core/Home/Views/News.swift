//
//  News.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct News: View {
    
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack {
//            Color.black.ignoresSafeArea()
            
            VStack(spacing: 15) {
                header
                
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        ForEach(Category.allCases, id: \.self) { cateory in
                            CategoryRowCell(
                                title: cateory.rawValue.capitalized,
                                isSelected: cateory == selectedCategory
                                )
                             .onTapGesture {
                                 selectedCategory = cateory
                             }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("SportNews")
//                .background(textColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.accentThree)
            .font(.system(size: 34, weight: .bold, design: .default))
        
            HStack(spacing: 16)  {
                ReloadButton()
                    .onTapGesture {
                        
                    }
                    .padding(-7)
                SearchButton()
                    .onTapGesture {
                        
                    }
                
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 6)
    }
}

#Preview {
    News()
}
