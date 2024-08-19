//
//  NewsImageService.swift
//  SportNews
//
//  Created by Michael on 8/20/24.
//

import Foundation
import SwiftUI
import Combine

class NewsImageService {
    
    @Published var image: UIImage? = nil

    private var imageSubscriptoin: AnyCancellable?
    private let news: NewsAPIDataModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "news_images"
    private let imageName: String

    init(news: NewsAPIDataModel) {
        self.news = news
        self.imageName = news.url!
        ()
    }
    
    private func getNewsImage() {
        if let savedImage = fileManager.getImage(imageName: news.uri!, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager")
        } else {
            downloadNewsImage()
            print("Downloading image now")
        }
    }
    
    private func downloadNewsImage() {
        guard let url = URL(string: news.image!) else { return }
        
        imageSubscriptoin = NewNetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NewNetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscriptoin?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
