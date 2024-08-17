//
//  MySavedRowsView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct MySavedRowsView: View {
    
    let news: Articles
    
       var data: String? = "4 Jan, 2024"
       var time: String? = "19:21"
       var subtitle: String? = "Soccer-FIFA Chief Hails Access for Women to Iran Stadium as Sign of Progucsad"
       var onAddToPlaylistPressed: (() -> Void)? = nil // can act without call in preview
    
    var body: some View {

        VStack(spacing: 16, content: {
            HStack {
                Image(systemName: "heart")
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            if let data {
                                Text(data)
                                    .foregroundStyle(.accentThree)
                                    .font(.callout)
                                    .fontWeight(.light)
                            }
                            
                            if let  time {
                                Text(time)
                                    .foregroundStyle(.accentTwo)
                                    .font(.callout)
                                    .fontWeight(.light)
                            }
                        }
                        .padding(.bottom, 6)
                        
                        
//                        if let subtitle {
                        Text(news.body ?? "")
                                .foregroundStyle(.layerOne)
                                .font(.headline)
                                .lineLimit(3)
//                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Text("⚽️ Soccer")
                            .foregroundStyle(.layerTwo)
                            .font(.callout)
                            .padding(4)
                            .background(Color.black.opacity(0.001))
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.trailing, 16)
            }
        })
    }
}
               
#Preview {
    MySavedRowsView(news: DeveloperPriview.instance.news)
}
