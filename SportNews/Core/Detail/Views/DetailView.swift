//
//  DetailView.swift
//  SportNews
//
//  Created by Michael on 8/26/24.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var news: NewsAPIDataModel?
    @EnvironmentObject private var vm: NewsViewModel
    
    var body: some View {
        ZStack{
            if let news = news {
                
                let index = vm.allNews.firstIndex(where: { $0.id == news.id})
                let colorIndex = (index ?? 4) % 4
                let accentColor = vm.getAccentColor(for: colorIndex)
                
                DetailView(news: news, cardBackground: accentColor.color, category: vm.selectedCategory.rawValue)
            }
        }
    }
}

struct DetailView: View {
    
    let news: NewsAPIDataModel
    let cardBackground: Color
    let category: String
    private let dataService = MySavedDataService()
    @Environment(\.dismiss) var presentationMode
    @State private var isSaved: Bool = false
    @State private var showDBNotification: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // background layer
                cardBackground.ignoresSafeArea()
                
                // content layer
                VStack {
                    header
                    VStack {
                        chatNewsToday
                        title
                        dateTime
                    }
                    ScrollView {
                        image
                        text
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .onAppear {
                isSaved = dataService.isNewsSaved(newsID: news.id)
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

#Preview {
    DetailView(news: DeveloperPreview.instance.news, cardBackground: .yellow, category: "")
}

//MARK: COMPONENTS

extension DetailView {
    
    private var header: some View {
        HStack {
            Button(action: {
                presentationMode.callAsFunction()
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundStyle(.black)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .foregroundStyle(Color.white.opacity(0.5))
                    )
            })
            Spacer()
            GoToSourceButton(news: news, heigth: 50, width: 50)
            Button {
                dataService.saveButtonPressed(news: news)
                isSaved.toggle()
                if !isSaved {
                    presentationMode.callAsFunction()
                }

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
        .padding()
    }
    
    private var chatNewsToday: some View {
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
        .padding(.leading, 16)
        .padding(.bottom, 6)
    }
    
    private var title: some View {
        HStack {
            if let title = news.title {
                Text(title)
                    .frame(width: 313, height: 128, alignment: .leading)
                    .foregroundStyle(.backgroudOne)
                    .setFont(.bold, size: 26)
                    .lineSpacing(6)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 16)
    }
    private var dateTime: some View {
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
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
    }
    
    private var image: some View {
        NewsImageView(news: news)
            .scaledToFill()
            .frame(width: 350, height: 200)
            .clipShape(.rect(cornerRadius: 25))
    }
    
    private var text: some View {
        VStack {
            if let body = news.body {
                Text(body)
                    .lineSpacing(5)
                    .frame(width: 350, alignment: .center)
                    .foregroundStyle(.backgroudThree)
                    .setFont(.light, size: 16)
            }
        }
        .padding(.top, 8)
    }
}
