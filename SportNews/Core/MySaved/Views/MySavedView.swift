//
//  MySavedView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct MySavedView: View {
    
    @EnvironmentObject private var vm: MySavedViewModel
    @EnvironmentObject private var newsVM: NewsViewModel
    private let mySavedDataService = MySavedDataService()
    
    @State private var showSearchTab: Bool = false
    
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
                    if vm.mySavedNews.isEmpty {
                        newsIsNotSavedText
                    Spacer()
                    } else {
                        mySavedNewsList
                    }
                }
            }
        }
        .onAppear {
            vm.getMySaved(for: vm.selectedCategory)
        }
    }
    
    private var newsIsNotSavedText: some View {
        Text("You haven't saved the \(String(describing: vm.selectedCategory).capitalized) news yet ...")
            .font(.system(size: 16, weight: .light))
            .fontWeight(.light)
            .foregroundStyle(.layerTwo)
    }
    
    
    
    private var header: some View {
        VStack {
            HStack(spacing: 6) {
                (Text("My ").foregroundColor(.layerOne) + Text("Saved").foregroundColor(.accentThree))
                    .setFont(.extraBold, size: 36)
                Spacer()
                
                SearchButton()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showSearchTab.toggle()
                        }
                    }
                    .padding(.trailing, 6)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
        }
    }
    
    private var categoryCell: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 6) {
                ForEach(MySavedCategory.allCases, id: \.self) { category in
                    CategoryRowCell(
                        title: category.rawValue.capitalized,
                        isSelected: category == vm.selectedCategory
                    )
                    .onTapGesture {
                        vm.selectedCategory = category
                        vm.getMySaved(for: category)
                    }
                }
            }
            .padding(.horizontal, 20)
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
            ForEach(vm.mySavedNews) { news in
                MySavedRowsView(category: newsVM.selectedCategory.rawValue, news: news)
            }
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
    }
}


#Preview {
    NavigationView(content: {
        MySavedView()
            .preferredColorScheme(.dark)
    })
    .environmentObject(TabBarViewmodel())
    .environmentObject(DeveloperPreview.instance.newsVM)
    .environmentObject(DeveloperPreview.instance.mySavedVM)
}

