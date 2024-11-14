//
//  MySavedViewModel.swift
//  SportNews
//
//  Created by Michael on 8/21/24.
//

import Foundation
import Combine
import SwiftUI

class MySavedViewModel: ObservableObject {
    
    @Published var allNews: [NewsAPIDataModel] = [] // when we check all news we append to this allNews array
    @Published var mySavedNews: [NewsAPIDataModel] = []
    @Published var searchText: String = ""
    
    private var dataService = MySavedDataService()
    private var cancellables = Set<AnyCancellable>()
    
    @AppStorage("selectedCategory") var selectedCategory: MySavedCategory = .soccer {
        didSet {
            getMySaved(for: selectedCategory)
        }
    }

    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] text in
                self?.mySavedNews = self?.filterNews(text: text, category: self?.selectedCategory ?? .all) ?? []
            }
            .store(in: &cancellables)
        
        // ort saved news based on allNews
        $allNews
            .combineLatest(dataService.$savedEntities)
            .map(mapAllCoinsToPortfolioCoins)
            .sink { [weak self] (filteredNews) in
                self?.mySavedNews = filteredNews
            }
            .store(in: &cancellables)
        
        dataService.$savedEntities
                  .sink { [weak self] _ in
                      self?.updateSavedNews()
                  }
                  .store(in: &cancellables)
    }

    private func filterNews(text: String, category: MySavedCategory) -> [NewsAPIDataModel] {
        guard !text.isEmpty else {
            return mySavedNews.filter { news in
                return category == .all || news.category == category.rawValue
            }
        }

        let lowercasedText = text.lowercased()

        return mySavedNews.filter { news in
            return (category == .all || news.category == category.rawValue) &&
                   (news.title?.lowercased().contains(lowercasedText) ?? false ||
                    news.body?.lowercased().contains(lowercasedText) ?? false)
        }
    }
    
    public func getMySaved(for category: MySavedCategory) {
        dataService.getMySaved(for: category)
        updateSavedNews()
    }
    
    private func mapAllCoinsToPortfolioCoins(allNews: [NewsAPIDataModel], newsAPIDataEntity: [NewsAPIDataEntity]) -> [NewsAPIDataModel] {
        allNews
            .compactMap { (news) -> NewsAPIDataModel? in
                guard newsAPIDataEntity.first(where: { $0.newsID == news.id }) != nil else {
                    return nil
                }
                return news
            }
    }
    
    private func updateSavedNews() {
        mySavedNews = dataService.savedEntities.map { entity in
            NewsAPIDataModel(
                uri: entity.newsID ?? "",
                date: entity.date,
                time: entity.time,
                dataType: entity.dataType,
                url: entity.url ?? "",
                title: entity.title,
                body: entity.body,
                image: entity.image,
                category: entity.category
            )
        }
        print("Updated mySavedNews: \(mySavedNews)")
    }
}
