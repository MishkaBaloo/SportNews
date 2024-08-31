//
//  MySavedViewModel.swift
//  SportNews
//
//  Created by Michael on 8/21/24.
//

import Foundation
import Combine

class MySavedViewModel: ObservableObject {
    
    
    @Published var allNews: [NewsAPIDataModel] = [] // when we check all news we append to this allNews array
    
    @Published var searchText: String = ""

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

// Our view has a reference to this view model, and this view model has a data service that we are initializing a new NewsDataService. And when we initialize this class NewsDataService in the init is calling getNews(). This func is gonna go to our url, it's gonna download the data, it's gonna check that it's valid data, it goind to decode that data and then it's going to take that data and append it to the allNews: [Array]. When things get appended to this arrat because it is publisged anything subscribed to this publisher will also get notified.
