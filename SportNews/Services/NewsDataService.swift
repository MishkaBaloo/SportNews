//
//  NewsDataService.swift
//  SportNews
//
//  Created by Michael on 8/22/24.
//

import Foundation
import Combine

class NewsDataService {
    
    @Published var allNews: [NewsAPIDataModel] = []
    
    var newsSubscriptions: AnyCancellable?
    
    init() {
        getNews()
    }
    
    private func getNews() {
        
        guard let url = URL(string: "https://eventregistry.org/api/v1/article/getArticles?apiKey=2f47856f-ecd6-410b-a4e1-2fc3b2d82cc2&resultType=articles&articlesPage=1&articlesCount=20&articlesSortBy=date&articlesSortByAsc=false&articleBodyLen=-1&dataType=news&forceMaxDataTimeWindow=7, 31&keyword=Sports&lang=eng")
        else { return }
        
        newsSubscriptions = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse) // breakpoint
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: NewsResult.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(String(describing: error)) // breakpoint
                }
            } receiveValue: { [weak self] returnedNews in
                self?.allNews = returnedNews.articles?.results ?? [] // breakpoint
                self?.newsSubscriptions?.cancel()
            }

    }
}
