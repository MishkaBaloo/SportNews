//
//  News.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct News: View {
    
    @EnvironmentObject private var vm: NewsViewModel
    
    @State private var selectedCategory: Category? = nil
    @State private var showSearchTab: Bool = false
    
    @State private var tabSelection: TabBarItem = .news
    
    var body: some View {
//        ZStack {
            // background layer
            
//            Image("BG").resizable()
//                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                if showSearchTab == false {
                    header
                } else {
                    searchBar
                }
                categoryCell
                
                
                Spacer()
                
                
                
            }
//        }
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
                    withAnimation(.easeInOut) {
                        showSearchTab.toggle()
                    }
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
    
    private var searchBar: some View {
        HStack {
            SearchTabBarView(searchText: $vm.searchText)
            CancelButton()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showSearchTab.toggle()
                    }
                }
        }
        .frame(maxWidth: .infinity)
        .background(.backgroudTwo)
        .frame(height: 50)
        .padding(.top)
        .padding(.bottom)
        
    }
}

#Preview {
//    NavigationView(content: {
        News()
            .preferredColorScheme(.dark)
//    })
            .environmentObject(DeveloperPreview.instance.newsVM)
}

