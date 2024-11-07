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
    
    @Published var mySavedNews: [MySavedEntity] = []
    @Published var searchText: String = ""
    
    private let dataService = MySavedDataService()
    private let newsDataService = NewsDataService()
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
                self?.mySavedNews = self?.filterNews(text: text) ?? [] // sorting based on searchBarText
            }
            .store(in: &cancellables)
    }
    
    private func filterNews(text: String) -> [MySavedEntity] {
        guard !text.isEmpty else {
            return dataService.savedEntities // Return all news if searchBarText isEmpty
        }
        
        let lowercasedText = text.lowercased()
        return dataService.savedEntities.filter {
            $0.title?.lowercased().contains(lowercasedText) ?? false || $0.body?.lowercased().contains(lowercasedText) ?? false
        }
    }
    
    func getMySaved(for category: MySavedCategory) {
        
        dataService.getMySaved(for: category)
        
        dataService.$savedEntities
            .receive(on: DispatchQueue.main)
            .sink { [weak self] news in
                self?.mySavedNews = news
            }
            .store(in: &cancellables)
    }
}

// Our view has a reference to this view model, and this view model has a data service that we are initializing a new NewsDataService. And when we initialize this class NewsDataService in the init is calling getNews(). This func is gonna go to our url, it's gonna download the data, it's gonna check that it's valid data, it goind to decode that data and then it's going to take that data and append it to the allNews: [Array]. When things get appended to this arrat because it is publisged anything subscribed to this publisher will also get notified.
