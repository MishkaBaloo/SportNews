//
//  NewsViewModel.swift
//  SportNews
//
//  Created by Michael on 8/20/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    
    @Published var allNews: [NewsAPIDataModel] = [] // when we check all news we append to this allNews array
    @Published var mySavedNews: [NewsAPIDataModel] = []
    @Published var searchText: String = ""
    private let dataService = NewsDataService()
    private let mySavedDataService = MySavedDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
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
//                         guard let entity = mySavedEntities.first(where: { $0.newsID == news.id }) else { // yellow notice that entity never used
                        guard mySavedEntities.first(where: { $0.newsID == news.id }) != nil else {
                            return nil
                        }
                        return news
                    }
            }
            .sink { [weak self] (returnedNews) in
                self?.mySavedNews = returnedNews
            }
            .store(in: &cancellables)
    }
    
    func saveButtonPressed(news: NewsAPIDataModel) {
        mySavedDataService.saveButtonPressed(news: news)
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

