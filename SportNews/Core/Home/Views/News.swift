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
    @State private var selectedNews: NewsAPIDataModel? = nil
    @State private var showDetailView: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            
            Image("BG").resizable()
                .ignoresSafeArea()
            
            // content layer
            VStack(spacing: 10) {
                VStack {
                    if showSearchTab == false {
                        header
                    } else {
                        searchBar
                    }
                    categoryCell
                    CustomRotationView()
                }
            }
        }
        .navigationDestination(isPresented: $showDetailView) {
            DetailLoadingView(news: $selectedNews)
        }
    }
    
    private func segue(news: NewsAPIDataModel) {
        selectedNews = news
        showDetailView.toggle()
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
            
            // reload nutton
            Button(action: {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            }, label: {
                Image(systemName: "arrow.clockwise")
                    .font(.title)
                    .foregroundStyle(.layerOne)
                    .frame(width: 50, height: 50)
                    .padding(.bottom, 3)
                    .background(
                    Circle()
                        .stroke(.layerOne, lineWidth: 1)
                        .fill(Color.black)
                    )
            })
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
            
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
                ForEach(Category.allCases, id: \.self) { category in
                    CategoryRowCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory)
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
}

#Preview {
    News()
        .environmentObject(DeveloperPreview.instance.newsVM)
    
}

