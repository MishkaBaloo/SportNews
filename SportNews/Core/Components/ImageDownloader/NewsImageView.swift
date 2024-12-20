//
//  NewsImageView.swift
//  SportNews
//
//  Created by Michael on 8/22/24.
//

import SwiftUI

struct NewsImageView: View {
    
    let news: NewsAPIDataModel
    let url = URL(string: "")
    
    var body: some View {
        
        AsyncImage(url: URL(string: news.image ?? "")) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let returnedImage):
                returnedImage
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image("newsNotLoadedImage")
                    .font(.headline)
            default:
                Image("newsNotLoadedImage")
                    .font(.headline)
            }
        }
    }
}

#Preview {
    NewsImageView(news: DeveloperPreview.instance.news)
}
