//
//  NewsViewModel.swift
//  SportNews
//
//  Created by Michael on 8/20/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    
    @Published var allNews: [NewsAPIDataModel] = [] // when we check all news we append to this allNews array // articles
    
    @Published var searchText: String = ""
    
    // maybe footbal ,bassketball news []

    private let dataService = NewsDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(dataService.$allNews)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterNews)
            .sink { [weak self] returnedNews in
                self?.allNews = returnedNews
            }
            .store(in: &cancellables)
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
}

