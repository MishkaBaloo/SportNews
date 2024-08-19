//
//  MySavedView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct MySavedView: View {
    
    @State private var newsIsNotSaved: Bool = true
    @State private var selectedCategory: MySavedCategory? = nil
    
    var body: some View {
        ZStack {
            // background layer
            Image("BG").resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                header
                categoryCell
                
                Spacer()
                if newsIsNotSaved {
                    Text("You haven't saved the news yet ...")
                        .font(.system(size: 16, weight: .light))
                        .fontWeight(.light)
                        .foregroundStyle(.layerTwo)
                } else {
                    
                }
                
                Spacer()
            }
        }
    }
    
    private var header: some View {
        HStack(spacing: 8) {
            HStack {
                Text("My ").foregroundStyle(.accentThree)
                +
                Text("Saved").foregroundStyle(.layerOne)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 34, weight: .bold))
            
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
                ForEach(MySavedCategory.allCases, id: \.self) { category in
                    CategoryRowCell(
                        title: category.rawValue.capitalized,
                        isSelected: category == selectedCategory
                    )
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
    MySavedView()
}
