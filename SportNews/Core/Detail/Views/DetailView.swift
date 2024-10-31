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
                let colorIndex = index! % 4
                let accentColor = vm.getAccentColor(for: colorIndex)
                
                DetailView(news: news, cardBackground: accentColor.color)
            }
        }
    }
}


struct DetailView: View {
    
    let news: NewsAPIDataModel
    let cardBackground: Color
    @EnvironmentObject private var vm: NewsViewModel
    @Environment(\.dismiss) var presentationMode
    
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
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    DetailView(news: DeveloperPreview.instance.news, cardBackground: .clear)
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
            GoToSourceButton(news: news)
            Button {
                vm.saveButtonPressed(news: news)
            } label: {
                Image(systemName: "bookmark")
                    .font(.title)
                    .foregroundStyle(.black)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .foregroundStyle(Color.layerOne.opacity(0.5))
                        )
            }
            ShareButton(news: news)
        }
        .padding()
    }
    
    private var chatNewsToday: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.backgroudOne)
                .overlay {
                    Text("CHAT News Today")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.layerOne)
                }
                .frame(width: 100, height: 20)
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
                    .font(.system(size: 26, weight: .bold))
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
        .font(.system(size: 16, weight: .bold))
        .foregroundStyle(.layerSix)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
    }
    
    private var image: some View {
        NewsImageView(news: news)
            .scaledToFill()
            .frame(width: 353, height: 200)
            .clipShape(.rect(cornerRadius: 25))
    }
    
    private var text: some View {
        VStack {
            if let body = news.body {
                Text(body)
                    .lineSpacing(2)
                    .frame(width: 353, alignment: .center)
                    .foregroundStyle(.backgroudThree)
                    .font(.system(size: 14, weight: .light))
            }
        }
        .padding(.top, 8)
    }
}
