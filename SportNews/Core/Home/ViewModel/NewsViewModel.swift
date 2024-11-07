//
//  NewsViewModel.swift
//  SportNews
//
//  Created by Michael on 8/20/24.
//

import Foundation
import Combine
import SwiftUI

class NewsViewModel: ObservableObject {
    
    @Published var allNews: [NewsAPIDataModel] = [] // when we check all news we append to this allNews array
    @Published var mySavedNews: [NewsAPIDataModel] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    private let dataService = NewsDataService()
    private let mySavedDataService = MySavedDataService()
    private var cancellables = Set<AnyCancellable>()
    
    @AppStorage("selectedCategory") var selectedCategory: Category = .soccer
    
    init() {
        loadNewsForSelectedCategory()
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates allNews
        $searchText
            .combineLatest(dataService.$allNews)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterNews)
            .sink { [weak self] returnedNews in
                self?.allNews = returnedNews
            }
            .store(in: &cancellables)
        
        
        // update mySaved news
        $allNews
            .combineLatest(mySavedDataService.$savedEntities)
            .map { (newsAPIDataModel, mySavedEntities) -> [NewsAPIDataModel] in
                
                newsAPIDataModel
                    .compactMap { (news) -> NewsAPIDataModel? in
                        guard mySavedEntities.first(where: { $0.newsID == news.id }) != nil else {
                            return nil
                        }
                        return news
                    }
            }
            .sink { [weak self] (returnedNews) in
                self?.mySavedNews = returnedNews
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    func saveButtonPressed(news: NewsAPIDataModel) {
        mySavedDataService.saveButtonPressed(news: news)
    }
    
    func reloadData() {
        isLoading = true
        dataService.getNews(for: selectedCategory)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.isLoading = false
        }
        HapticManager.notification(type: .success)
    }
    
    private func filterNews(text: String, news: [NewsAPIDataModel]) -> [NewsAPIDataModel] {
        guard !text.isEmpty else {
            return news
        }
        
        let lowercasedText = text.lowercased()
        
        return  allNews.filter { news in
            return news.title!.lowercased().contains(lowercasedText) ||
            news.body!.lowercased().contains(lowercasedText)
        }
    }
    
    func getAccentColor(for index: Int) -> AccentColor {
            switch index {
            case 0:
                return .accentOne
            case 1:
                return .accentTwo
            case 2:
                return .accentThree
            case 3:
                return .accentFour
            default:
                return .accentOne
            }
        }
    
    func getNews(for category: Category) {
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = true  // Show ProgressView on main thread
        }
        
        dataService.getNews(for: category)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in  // Short delay for smooth display
            self?.dataService.$allNews
                .receive(on: DispatchQueue.main)
                .sink { news in
                    self?.allNews = news
                    self?.isLoading = false  // Hide ProgressView on main thread
                }
                .store(in: &self!.cancellables)
        }
    }
    
    func loadNewsForSelectedCategory() {
        isLoading = true
        dataService.getNews(for: selectedCategory)  // Get news for selectedCategory
    }
}
