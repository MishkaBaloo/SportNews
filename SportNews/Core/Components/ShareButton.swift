//
//  ShareButton.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI


struct ShareButton: View {
    
    let iconName: String = "Share"
    let news: NewsAPIDataModel
    let heigth: CGFloat
    let width: CGFloat
    var url: String { news.url }
        
        var body: some View {
            if let url = URL(string: url) {
                ShareLink(item: url) {
                    
                    Image(iconName)
                        .font(.title)
                        .foregroundStyle(.black)
                        .frame(width: width, height: heigth)                        .background(
                            Circle()
                                .foregroundStyle(Color.white.opacity(0.5))
                            )
                }
            }
        }
    }

#Preview {
    ShareButton(news: DeveloperPreview.instance.news, heigth: 50, width: 50)
}


