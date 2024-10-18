//
//  ColorsTask.swift
//  SportNews
//
//  Created by Michael on 10/17/24.
//

import SwiftUI

struct ColorsTask: View {
    
    let items = ["NewsCard 1", "NewsCard 2", "NewsCard 3", "NewsCard 4", "NewsCard 5", "NewsCard 6", "NewsCard 7", "NewsCard 8"]
    
    
    var body: some View {
        VStack {
            ForEach(items.indices, id: \.self) { index in
                let colorIndex = index % 4
                let accentColor = getAccentColor(for: colorIndex)
                
                Text(items[index])
                    .padding()
                    .background(accentColor.color)
            }
        }
        
    }
    
    private func getAccentColor(for index: Int) -> AccentColor {
            switch index {
            case 0:
                return .accentOne
            case 1:
                return .accentTwo
            case 2:
                return .accentThree
            case 3:
                return .accentFour
            default:
                return .accentOne
            }
        }
}
    

#Preview {
    ColorsTask()
}
