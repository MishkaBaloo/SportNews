//
//  GoToSourceButton.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct GoToSourceButton: View {
    
    let news: NewsAPIDataModel
    let heigth: CGFloat
    let width: CGFloat
    var url: String { news.url }
    let iconName: String = "attach-square"
    
    var body: some View {

        Link(destination: URL(string: url)!, label: {
                Image(iconName)
                .font(.title)
                .foregroundStyle(.black)
                .frame(width: heigth, height: width)
                .background(
                    Circle()
                        .foregroundStyle(Color.white.opacity(0.5))
            )
        })
    }
}

#Preview {
    GoToSourceButton(news: DeveloperPreview.instance.news, heigth: 50, width: 50)
}


