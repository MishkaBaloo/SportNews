//
//  MySavedRowsView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct MySavedRowsView: View {
    
    private let mySavedDataService = MySavedDataService()
    
    var body: some View {
  
        ScrollView {
            ForEach(mySavedDataService.savedEntities) { entity in
                VStack(spacing: 32) {
                    HStack {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.accentTwo, lineWidth: 1.0)
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
                    .background(.backgroudTwo)
                    .clipShape(.rect(cornerRadius: 35))
                }
                .frame(width: 353, height: 140)
            }
        }
        .scrollIndicators(.hidden)
    }
}
               
#Preview {
    MySavedRowsView()

}
