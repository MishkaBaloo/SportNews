//
//  MySavedRowsView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct MySavedRowsView: View {
    @State private var isShowingDialog = false
    @State private var vm = NewsViewModel()
    @State private var dataService = MySavedDataService()
    @State private var showDetailView: Bool = false
    @State private var selectedNews: NewsAPIDataModel? = nil
    
    let category: String
    let news: NewsAPIDataModel
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 6) {
                
                let index = vm.allNews.firstIndex(where: {$0.id == news.id})
                let colorIndex = (index ?? 4) % 4
                let accentColor = vm.getAccentColor(for: colorIndex)
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(accentColor.color, lineWidth: 1.0)
                    .background {
                        AsyncImage(url: URL(string: news.image ?? "")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let returnedImage):
                                returnedImage
                                    .resizable()
                                    .scaledToFit()
                            case .failure:
                                Image("icon")
                                    .font(.headline)
                            default:
                                Image("icon")
                                    .font(.headline)
                            }
                        }
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(.rect(cornerRadius: 25))
                    }
                    .frame(width: 120, height: 120)
                    .padding(.horizontal, 8)
                
                VStack(alignment: .leading, spacing: 6, content: {
                    dateTime
                    title
                    categoryCell
                })
            }
            .frame(width: 353, height: 140)
            .background(.backgroudTwo.opacity(0.95))
            .clipShape(.rect(cornerRadius: 35))
            .onTapGesture(perform: {
                segue(news: news)
            })
            .onLongPressGesture(perform: {
                isShowingDialog.toggle()
                HapticManager.notification(type: .success)
            })
            .confirmationDialog("Option", isPresented: $isShowingDialog, titleVisibility: .visible, actions: {
                Section {
                    if let url = URL(string: news.url) {
                        ShareLink(item: url) {
                            Text("Share")
                        }
                    }
                }
                Section {
                    if let newsUrl = URL(string: news.url) {
                        Link(destination: newsUrl, label: {
                            Text("Go to Source")
                        })
                    }
                }
                Section {
                    Button(role: .destructive) {
                        dataService.deleteNewsMySaved(news: news)
                    } label: {
                        Text("Remove from Saved")
                    }
                }
            }, message: {
                Text("Here you can share the article with your friends or remove it from your saves. You can also go to the website of the author of the article.")
            })
        }
        .navigationDestination(isPresented: $showDetailView) {
            DetailLoadingView(news: $selectedNews)
        }
    }
    
    private func segue(news: NewsAPIDataModel) {
        selectedNews = news
        showDetailView.toggle()
    }
}

#Preview {
    MySavedRowsView(category: "", news: DeveloperPreview.instance.news)
}

extension MySavedRowsView {
    
    private var dateTime: some View {
        HStack {
            if let date = news.date {
                Text(date)
                    .foregroundStyle(.accentThree)
            }
            Text("•")
                .foregroundStyle(Color.layerOne)
            
            if let time = news.time {
                Text(time)
                    .foregroundStyle(.accentTwo)
            }
        }
        .setFont(.light, size: 14)
    }
    
    private var title: some View {
        Text(news.title ?? "")
            .setFont(.bold, size: 16)
            .foregroundStyle(.layerOne)
            .lineLimit(3)
            .lineSpacing(5)
            .padding(.trailing, 16)
    }
    
    private var categoryCell: some View {
        HStack {
            Text(category) // Display the category of the news
                .setFont(.extraBold, size: 12)
                .background(Color.black.opacity(0.001))
                .offset(x: -4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.layerTwo)
                .setFont(.light, size: 16)
        }
    }
}
