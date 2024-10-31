//
//  News.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI
import CollectionViewPagingLayout


struct News: View {
    
    @EnvironmentObject private var vm: NewsViewModel
    @State private var showDetailView: Bool = false
//    @State private var selectedCategory: Category = .soccer
    @State private var showSearchTab: Bool = false
    @State private var selectedNews: NewsAPIDataModel? = nil
    
    var body: some View {
        NavigationStack {
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
                        if vm.isLoading {
                            Spacer(minLength: 0)
                            ProgressView("Loading news...")
                                .progressViewStyle(CircularProgressViewStyle())
                                Spacer(minLength: 0)
                        } else {
                            cardsNewsCell
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $showDetailView) {
                DetailLoadingView(news: $selectedNews)
            }
        }
        .onAppear {
            vm.loadNewsForSelectedCategory()  // Load news for selected category at launch
        }
    }
    
    private func segue(news: NewsAPIDataModel) {
        selectedNews = news
        showDetailView.toggle()
    }
    
    private var cardsNewsCell: some View {
                        
            StackPageView(vm.allNews) { news in
                
                let index = vm.allNews.firstIndex(where: { $0.id == news.id})
                let colorIndex = (index ?? 4) % 4
                let accentColor = vm.getAccentColor(for: colorIndex)
                
                NewsCard(news: news, cardBackground: accentColor.color)
                Spacer(minLength: 0)
            }
            .options(.init(
                scaleFactor: -0.03,
                minScale: 0,
                maxStackSize: 3,
                spacingFactor: 0.01,
                alphaFactor: 0.1,
                shadowRadius: 8,
                stackRotateAngel: .pi / 36,
                popAngle: .pi / 4,
                popOffsetRatio: .init(width: -1.45, height: 0.4),
                stackPosition: CGPoint(x: 0, y: 1)
            ))
        
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
            
            Button(action: {
                    vm.reloadData()
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.title)
                    .foregroundStyle(.layerOne)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .stroke(.layerOne, lineWidth: 1)
                            .fill(Color.black)
                    )
            })
            
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
                    CategoryRowCell(title: category.rawValue.capitalized, isSelected: category == vm.selectedCategory)
                        .onTapGesture {
                            vm.selectedCategory = category // Set new category using @AppStorage in NewsViewModel
                            vm.getNews(for: category) // reload news for new category
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.bottom, 16)
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

