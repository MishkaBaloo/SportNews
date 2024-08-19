//
//  NewsImageVIewModel.swift
//  SportNews
//
//  Created by Michael on 8/20/24.
//

import Foundation
import SwiftUI
import Combine

class NewsImageVIewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let news: NewsAPIDataModel
    private let dataService: NewsImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(news: NewsAPIDataModel) {
        self.news = news
        self.dataService = NewsImageService(news: news)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
    
}
