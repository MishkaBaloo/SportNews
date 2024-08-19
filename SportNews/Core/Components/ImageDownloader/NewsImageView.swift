//
//  NewsImageView.swift
//  SportNews
//
//  Created by Michael on 8/20/24.
//

import SwiftUI

struct NewsImageView: View {
    
    @StateObject var vm: NewsImageVIewModel
    
    init(news: NewsAPIDataModel) {
        _vm = StateObject(wrappedValue: NewsImageVIewModel(news: news))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(.layerThree)
            }
        }
    }
}

struct NewsImageView_Previews: PreviewProvider {
    static var previews: some View {
        NewsImageView(news: DeveloperPriview.instance.news)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
