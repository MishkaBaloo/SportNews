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
      
        dataService.$allNews
            .sink { [weak self] (returnedNews) in
                self?.allNews = returnedNews
            }
            .store(in: &cancellables)
    }
}
