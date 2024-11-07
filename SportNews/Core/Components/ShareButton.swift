//
//  ShareButton.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI


struct ShareButton: View {
    
    let iconName: String = "square.and.arrow.up"
    let news: NewsAPIDataModel
    let heigth: CGFloat
    let width: CGFloat
    var url: String { news.url }
        
        var body: some View {
            if let url = URL(string: url) {
                ShareLink(item: url) {
                    
                    Image(systemName: iconName)
                        .font(.title)
                        .foregroundStyle(.black)
                        .frame(width: width, height: heigth)
                        .padding(.bottom, 6)
                        .background(
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


