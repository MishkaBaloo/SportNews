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
            // background layer
            
            Image("BG").resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                    header
                    categoryCell
                
                VStack {
                    
                }
                    
                    Spacer()
            }
        }
    }
    
    private var header: some View {
        HStack(spacing: 8) {
            
            HStack {
                Text("Sports").foregroundStyle(.accentThree)
                +
                Text("News").foregroundStyle(.layerOne)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 34, weight: .bold))
            
            ReloadButton()
                .onTapGesture {
                    
                }
            
            SearchButton()
                .onTapGesture {
                    
                }
                .padding(.trailing, 6)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 16)
    }
    
    private var categoryCell: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(Category.allCases, id: \.self) { category in
                    CategoryRowCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        //        .padding(.horizontal, 16) // if want to scroll under 16 inch of horizontal
        .scrollIndicators(.hidden)
    }
}

#Preview {
    News()
}
