//
//  NewsDataService.swift
//  SportNews
//
//  Created by Michael on 8/22/24.
//

import Foundation
import Combine

class NewsDataService {
    
    @Published var allNews: [NewsAPIDataModel] = [] // Articles
    
    var newsSubscriptions: AnyCancellable?
    
    init() {
        getNews()
    }
    
    private func getNews() {
        
        guard let url = URL(string: "https://eventregistry.org/api/v1/article/getArticles?apiKey=4d03267dc-604d-424d-ac45-e50b511100c4&resultType=articles&articlesPage=1&articlesCount=100&articlesSortBy=date&articlesSortByAsc=false&articleBodyLen=-1&dataType=news&forceMaxDataTimeWindow=7, 31&keyword=Sports&lang=eng")
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
            .decode(type: NewsResult.self, decoder: JSONDecoder()) // [Articles]
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
//                    print(error.localizedDescription)
                    print(String(describing: error)) // breakpoint
                }
            } receiveValue: { [weak self] returnedNews in
                self?.allNews = returnedNews.articles?.results ?? [] // breakpoint
                self?.newsSubscriptions?.cancel()
            }

    }
}
