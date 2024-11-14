//
//  NewsCardView.swift
//  SportNews
//
//  Created by Michael on 9/19/24.
//

import SwiftUI

struct NewsCard: View {
    
    @EnvironmentObject private var vm: NewsViewModel
    @State private var showDetailView: Bool = false
    @State private var selectedNews: NewsAPIDataModel? = nil
    @State private var isSaved: Bool = false
    
    private let dataService = MySavedDataService()
    let news: NewsAPIDataModel
    let cardBackground: Color
    let category: String
    
    var body: some View {
        GeometryReader { geometry in
            
            let widthScale = geometry.size.width / 390 
            let heightScale = geometry.size.height / 550
            let scaleFactor = min(widthScale, heightScale)
            
            VStack {
                sourceView
                title
                dateTime
                bodyCard
                buttons
            }
            .onAppear {
                isSaved = dataService.isNewsSaved(newsID: news.id) // Check if news is already saved
            }
            .navigationDestination(isPresented: $showDetailView) {
                DetailLoadingView(news: $selectedNews)
            }
            .frame(width: 340 * scaleFactor, height: 520 * scaleFactor)
            .background(cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 35 * scaleFactor))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
    
    private func segue(news: NewsAPIDataModel) {
        selectedNews = news
        showDetailView.toggle()
    }
}

#Preview {
    NewsCard(news: DeveloperPreview.instance.news, cardBackground: .green, category: "")
}

extension NewsCard {
    
    private var sourceView: some View {
        HStack {
            
            Text(category) // Display the category of the news
                .setFont(.extraBold, size: 12)
                .foregroundColor(cardBackground)
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
                .background(Color.backgroudOne.cornerRadius(10.adaptive))
            
            Text("CHAT News Today")
            .setFont(.extraBold, size: 12)
            .foregroundColor(cardBackground)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.backgroudOne.cornerRadius(10.adaptive))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 20)
        .padding(.leading, 16)
    }
    
    private var title: some View {
        HStack {
            if let title = news.title {
                Text(title)
                    .frame(width: 313, height: 128, alignment: .leading)
                    .foregroundStyle(.backgroudOne)
                    .setFont(.bold, size: 26)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 16)
    }
    
    private var dateTime: some View {
        VStack {
            HStack {
                if let date = news.date {
                    Text(date)
                }
                Text("•")
                if let time = news.time {
                    Text(time)
                }
            }
            .setFont(.bold, size: 16)
            .foregroundStyle(.layerSix)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 16)
    }
    
    private var bodyCard: some View {
        VStack {
            if let body = news.body {
                Text(body)
                    .lineSpacing(5)
                    .frame(width: 293, height: 215, alignment: .center)
                    .foregroundStyle(.backgroudThree)
                    .setFont(.light, size: 14)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top, 8)
    }
    
    private var buttons: some View {
        HStack {
            Button(action: {
                segue(news: news)
            }, label: {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.backgroudThree, lineWidth: 2.0)
                    .frame(width: 110, height: 50)
                    .foregroundStyle(.clear)
                    .overlay {
                        Text("Read Full")
                            .foregroundStyle(.backgroudOne)
                            .setFont(.bold, size: 16)
                    }
            })
            .padding()
            
            Spacer()
            
            GoToSourceButton(news: news, heigth: 50, width: 50)
            
            Button {
                dataService.saveButtonPressed(news: news)
                isSaved.toggle()
            } label: {
                withAnimation(.easeInOut, {
                    Image(isSaved ? "SavedNews" : "UnsavedNews")
                })
                .font(.title)
                .foregroundStyle(.black)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .foregroundStyle(Color.layerOne.opacity(0.5))
                )
            }
            
            ShareButton(news: news, heigth: 50, width: 50)
        }
        .padding(.trailing, 8)
    }
}
