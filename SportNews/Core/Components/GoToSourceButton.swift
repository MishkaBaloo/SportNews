//
//  GoToSourceButton.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct GoToSourceButton: View {
    
    let news: NewsAPIDataModel
    var url: String { news.url }
    
    let iconName: String = "shazam.logo"
    
    var body: some View {
            Link(destination: URL(string: url)!, label: {
                Image(systemName: iconName)
                .font(.title)
                .foregroundStyle(.black)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .foregroundStyle(Color.white.opacity(0.5))
            )
        })
    }
}

#Preview {
    GoToSourceButton(news: DeveloperPreview.instance.news)
}
