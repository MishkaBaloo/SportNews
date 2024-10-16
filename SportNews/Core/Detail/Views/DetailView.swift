//
//  DetailView.swift
//  SportNews
//
//  Created by Michael on 8/26/24.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @EnvironmentObject private var coordinator: Coordinator

    
    @Binding var news: NewsAPIDataModel?
    
    var body: some View {
        ZStack{
            if let news = news {
                DetailView(news: news)
            }
        }
    }
}


struct DetailView: View {
    
    let news: NewsAPIDataModel
    
    @Environment(\.dismiss) var presentationMode
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            
            // background layer
            Color.newsBackground.colors.randomElement()
                .ignoresSafeArea()
            
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
    }
}

#Preview {
    DetailView(news: DeveloperPreview.instance.news)
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
            SaveButton()
            ShareButton()
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
