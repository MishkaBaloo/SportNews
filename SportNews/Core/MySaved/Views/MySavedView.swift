//
//  MySavedView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct MySavedView: View {
    
    @EnvironmentObject private var vm: NewsViewModel
    
    private let mySavedDataService = MySavedDataService()
    
    @State private var newsIsNotSaved: Bool = false
    @State private var selectedCategory: MySavedCategory? = nil
    @State private var selectedNews: NewsAPIDataModel? = nil
    @State private var showSearchTab: Bool = false
    @State private var showDetailView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // background layer
                Image("BG").resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    if showSearchTab == false {
                        header
                    } else {
                        searchBar
                    }
                    categoryCell
                    
                    Spacer(minLength: 0)
                    
                    if newsIsNotSaved {
                        Text("You haven't saved the news yet ...")
                            .font(.system(size: 16, weight: .light))
                            .fontWeight(.light)
                            .foregroundStyle(.layerTwo)
                    } else {
                        mySavedNewsList
                    }
                }
            }
            .navigationDestination(isPresented: $showDetailView) {
                DetailLoadingView(news: $selectedNews)
            }
        }
    }
    
    private var header: some View {
        HStack {
            HStack {
                Text("My ").foregroundStyle(.accentThree)
                +
                Text("Saved").foregroundStyle(.layerOne)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 34, weight: .bold))
            
            SearchButton()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showSearchTab.toggle()
                    }
                }
                .padding(.trailing, 6)
        }
        .frame(maxWidth: .infinity)
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
    
    private var mySavedNewsList: some View {
        ScrollView {
            MySavedRowsView()
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
    }
    
    private func segue(news: NewsAPIDataModel) {
        selectedNews = news
        showDetailView.toggle()
    }
}


#Preview {
    NavigationView(content: {
        MySavedView()
            .preferredColorScheme(.dark)
    })
    .environmentObject(DeveloperPreview.instance.newsVM)
}

