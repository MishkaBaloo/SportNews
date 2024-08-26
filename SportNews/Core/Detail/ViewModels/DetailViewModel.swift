//
//  DetailViewModel.swift
//  SportNews
//
//  Created by Michael on 8/26/24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    
    @Published var allNews: [NewsAPIDataModel] = [] // when we check all news we append to this allNews array
    

    private let dataService = NewsDataService()
    private var cancellables = Set<AnyCancellable>()
    
//    init() {
//        self.allNews = allNews
//        self.dataService = 
//        addSubscribers()
//    }
    
    func addSubscribers() {
      
        dataService.$allNews
            .sink { [weak self] (returnedNews) in
                self?.allNews = returnedNews
            }
            .store(in: &cancellables)
    }
}
