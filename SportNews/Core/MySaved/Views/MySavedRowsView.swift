//
//  MySavedRowsView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct MySavedRowsView: View {
    @State private var isPress: Bool = false
    @State private var isShowingDialog = false
    @State private var vm = MySavedViewModel()
    @State private var dataService = MySavedDataService()
    
    @State private var showDetailView: Bool = false
    @State private var selectedNews: MySavedEntity? = nil
    
    let entity: MySavedEntity
    
    var body: some View {
        NavigationStack {
            HStack {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.accentThree, lineWidth: 1.0)
                    .background {
                        AsyncImage(url: URL(string: entity.image ?? "")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let returnedImage):
                                returnedImage
                                    .resizable()
                                    .scaledToFit()
                            case .failure:
                                Image(systemName: "questionmark")
                                    .font(.headline)
                            default:
                                Image(systemName: "questionmark")
                                    .font(.headline)
                            }
                        }
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(.rect(cornerRadius: 25))
                    }
                    .frame(width: 120, height: 120)
                    .padding(.horizontal, 8)
                
                VStack(alignment: .leading, spacing: 0, content: {
                    HStack {
                        if let date = entity.date {
                            Text(date)
                                .foregroundStyle(.accentThree)
                                .font(.callout)
                                .fontWeight(.light)
                        }
                        Text("•")
                            .foregroundStyle(Color.layerOne)
                        
                        if let time = entity.time {
                            Text(time)
                                .foregroundStyle(.accentTwo)
                                .font(.callout)
                                .fontWeight(.light)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 4)
                    
                    VStack {
                        if let title = entity.title {
                            Text(title)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.layerOne)
                                .lineLimit(3)
                        }
                    }
                    .padding(.trailing, 16)
                    
                    HStack {
                        if let dataType = entity.dataType {
                            Text(dataType)
                                .foregroundStyle(.layerTwo)
                                .font(.callout)
                                .padding(4)
                                .background(Color.black.opacity(0.001))
                                .offset(x: -4)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.bottom, 10)
                })
            }
            .frame(width: 353, height: 140)
            .background(.backgroudTwo)
            .clipShape(.rect(cornerRadius: 35))
            .onTapGesture(perform: {
                segue(entity: entity)
            })
            .onLongPressGesture(perform: {
                isShowingDialog.toggle()
                HapticManager.notification(type: .success)
            })
            .confirmationDialog("Option", isPresented: $isShowingDialog, titleVisibility: .visible, actions: {
                
                Section {
                    if let url = URL(string: entity.url!) {
                        ShareLink(item: url) {
                            Text("Share")
                        }
                    }
                }
                
                Section {
                    if let newsUrl = URL(string: entity.url!) {
                        Link(destination: newsUrl, label: {
                            Text("Go to Source")
                        })
                    }
                }
                
                Section {
                    Button(role: .destructive) {
                        dataService.deleteNewsMySaved(entity: entity)
                        
                    } label: {
                        Text("Remove from Saved")
                    }
                }
            }, message: {
                Text("Here you can share the article with your friends or remove it from your saves. You can also go to the website of the author of the article.")
            })
        }
        .navigationDestination(isPresented: $showDetailView) {
            DetailLoadingViewMySaved(entity: $selectedNews)
        }
    }
    
    private func segue(entity: MySavedEntity) {
        selectedNews = entity
        showDetailView.toggle()
    }
}

//#Preview {
//    MySavedRowsView(entity: DeveloperPreview.instance.entity)
//    MySavedRowsView()
//}
