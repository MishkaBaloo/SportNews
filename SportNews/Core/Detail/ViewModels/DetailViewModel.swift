//
//  DetailViewModel.swift
//  SportNews
//
//  Created by Michael on 8/26/24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    
    @Published var allNews: [NewsAPIDataModel] = []
    
    private let dataService: NewsDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(allNews: NewsAPIDataModel) {
        self.allNews = Array(arrayLiteral: allNews)
        self.dataService = NewsDataService()
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
