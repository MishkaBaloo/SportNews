//
//  MySavedRowsView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct MySavedRowsView: View {
    
    let news: NewsAPIDataModel
    
    var body: some View {
        
        VStack(spacing: 32) {
            HStack { // PHOTO AREA
                //                VStack(alignment: .leading, spacing: 8) {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.accentTwo, lineWidth: 1.0)
                    .background {
                        NewsImageView(news: news)
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(.rect(cornerRadius: 25))
                    }
                    .frame(width: 120, height: 120)
                //                }
                
                    .padding(.horizontal, 8)
                
                VStack(alignment: .leading, spacing: 0, content: {
                    //                    VStack(alignment: .leading, spacing: 12, content: {
                    HStack { // DATE && TIME AREA
                        if let date = news.date {
                            Text(date)
                                .foregroundStyle(.accentThree)
                                .font(.callout)
                                .fontWeight(.light)
                        }
                        
                        Text("•")
                            .foregroundStyle(Color.layerOne)
                        
                        if let time = news.time {
                            Text(time)
                                .foregroundStyle(.accentTwo)
                                .font(.callout)
                                .fontWeight(.light)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 4)
                    
                    
                    VStack {
                        if let title = news.title {
                            Text(title)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.layerOne)
                                .lineLimit(3)
                        }
                    }
                    .padding(.trailing, 16)
                    
                    
                    HStack {
                        if let dataType = news.dataType {
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
                //                })
                
            }
            .background(.backgroudTwo)
            .clipShape(.rect(cornerRadius: 35))
        }
        .frame(width: 353, height: 140)
    }
}
               
#Preview {
    MySavedRowsView(news: DeveloperPreview.instance.news)
}
