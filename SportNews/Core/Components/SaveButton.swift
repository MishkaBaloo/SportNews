//
//  SaveButton.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct SaveButton: View {
    
    private let dataService = MySavedDataService()
    let news: NewsAPIDataModel
    let action: () -> Void
    
    @State private var isSaved: Bool = false
    
    var body: some View {
        
        Button(action: action) {
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
        .onAppear(perform: {
            isSaved = dataService.isNewsSaved(newsID: news.id)
        })
    }
}


#Preview {
    SaveButton(news: DeveloperPreview.instance.news, action: {})
}
