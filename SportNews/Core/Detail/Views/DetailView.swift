//
//  DetailView.swift
//  SportNews
//
//  Created by Michael on 8/26/24.
//

import SwiftUI

struct DetailLoadingView: View {
    
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
    
    
    var body: some View {
        ZStack {
            
            // background layer
            Color.accentOne.ignoresSafeArea()
            
            // content layer
            VStack {
                
                HStack {
                    BackButton()
                    Spacer()
                    GoToSourceButton(news: news)
                    SaveButton()
                    ShareButton()
                }
                .padding()
                
                VStack {
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.backgroudOne)
                            .overlay {
                                Text("CHAT News Today")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundStyle(.accentOne)
                            }
                            .frame(width: 100, height: 20)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.bottom, 6)
                    
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
                    
                    HStack {
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
                }
                ScrollView {
                    NewsImageView(news: news)
                        .scaledToFill()
                        .frame(width: 353, height: 200)
                        .clipShape(.rect(cornerRadius: 25))
                    
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
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    DetailView(news: DeveloperPreview.instance.news)
}
