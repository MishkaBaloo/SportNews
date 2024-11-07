//
//  CustomNewsCard.swift
//  SportNews
//
//  Created by Michael on 11/7/24.
//

import SwiftUI

struct CustomNewsCard: View {
    
    @EnvironmentObject private var vm: NewsViewModel
    @State private var showDetailView: Bool = false
    @State private var selectedNews: NewsAPIDataModel? = nil
    
    let news: NewsAPIDataModel
    let cardBackground: Color
    
    var body: some View {
        GeometryReader { geometry in
            let widthScale = geometry.size.width /*/ 390*/
            let heightScale = geometry.size.height /*/ 550*/
            let scaleFactor = min(widthScale, heightScale) // Обираємо менше значення між шириною та висотою для пропорційного масштабування
            
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10 * scaleFactor)
                        .foregroundStyle(.backgroudOne)
                        .overlay {
                            Text("CHAT News Today")
                                .font(.system(size: 10 * scaleFactor, weight: .bold))
                                .foregroundStyle(.layerOne)
                        }
                        .frame(width: 100 * scaleFactor, height: 20 * scaleFactor)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20 * scaleFactor)
                .padding(.leading, 16 * scaleFactor)
                
                HStack {
                    if let title = news.title {
                        Text(title)
                            .frame(width: 313 * scaleFactor, height: 128 * scaleFactor, alignment: .leading)
                            .foregroundStyle(.backgroudOne)
                            .font(.system(size: 26 * scaleFactor, weight: .bold))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16 * scaleFactor)
                
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
                    .font(.system(size: 16 * scaleFactor, weight: .bold))
                    .foregroundStyle(.layerSix)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16 * scaleFactor)
                
                VStack {
                    if let body = news.body {
                        Text(body)
                            .lineSpacing(3 * scaleFactor)
                            .frame(width: 293 * scaleFactor, height: 215 * scaleFactor, alignment: .center)
                            .foregroundStyle(.backgroudThree)
                            .font(.system(size: 14 * scaleFactor, weight: .light))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 8 * scaleFactor)
                
                HStack {
                    Button(action: {
                        segue(news: news)
                    }, label: {
                        RoundedRectangle(cornerRadius: 25 * scaleFactor)
                            .stroke(.backgroudThree, lineWidth: 2.0 * scaleFactor)
                            .frame(width: 110 * scaleFactor, height: 50 * scaleFactor)
                            .foregroundStyle(.clear)
                            .overlay {
                                Text("Read Full")
                                    .foregroundStyle(.backgroudOne)
                                    .font(.system(size: 16 * scaleFactor, weight: .bold))
                            }
                    })
                    .padding()
                    
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
                        .padding(.trailing, 8 * scaleFactor)
                }
            }
            .navigationDestination(isPresented: $showDetailView) {
                DetailLoadingView(news: $selectedNews)
            }
            .frame(width: 340 * scaleFactor, height: 520 * scaleFactor)
            .background(cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 35 * scaleFactor))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) // Центрування картки
        }
    }
    
    private func segue(news: NewsAPIDataModel) {
        selectedNews = news
        showDetailView.toggle()
    }
}


#Preview {
    CustomNewsCard(news: DeveloperPreview.instance.news, cardBackground: .green)
}
