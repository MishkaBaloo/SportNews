//
//  CustomRotationView.swift
//  SportNews
//
//  Created by Michael on 8/24/24.
//

import SwiftUI
import CollectionViewPagingLayout



struct CustomRotationView: View {
    
    @EnvironmentObject private var vm: NewsViewModel
    @State private var saveButtonPress: Bool = false
    @State var mySavedDataService = MySavedDataService()
    
    let news: NewsAPIDataModel
    
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.backgroudOne)
                    .overlay {
                        Text("CHAT News Today")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(.accentOne)
                    }
                    .frame(width: 100, height: 20)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
            .padding(.leading, 16)
            .padding(.bottom, 6)
            
            HStack {
                if let title = news.title {
                    Text(title)
                        .frame(width: 313, height: 128, alignment: .leading)
                        .foregroundStyle(.backgroudOne)
                        .font(.system(size: 26, weight: .bold))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
            
            VStack {
                HStack {
                    
                    if let date = news.date {
                        Text(date)
                    }
                    Text("•")
                    
                    if let time = news.time {
                        Text(time)
                    }
                }
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.layerSix)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 16)
            
            
            VStack {
                if let body = news.body {
                    Text(body)
                        .lineSpacing(3)
                        .frame(width: 293, height: 215, alignment: .center)
                        .foregroundStyle(.backgroudThree)
                        .font(.system(size: 14, weight: .light))
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 8)
            
            HStack {
                HStack {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.backgroudThree, lineWidth: 2.0)
                        .frame(width: 110, height: 50)
                        .foregroundStyle(.clear)
                        .overlay {
                            Text("Read Full")
                                .foregroundStyle(.backgroudOne)
                                .font(.system(size: 16, weight: .bold))
                        }
                        .onTapGesture {
                            
                        }
                        .padding()
                    Spacer()
                    
                    GoToSourceButton(news: news)
                    
                    Button {
                        vm.saveButtonPressed(news: news)
                        
                    } label: {
                        Image(systemName: "bookmark")
                            .font(.title)
                            .foregroundStyle(.black)
                            .frame(width: 50, height: 50)
                            .background(
                                Circle()
                                    .foregroundStyle(Color.layerOne.opacity(0.5))
                            )
                    }
                    ShareButton(news: news)
                        .padding(.trailing, 6)
                }
            }
        }
        .frame(width: 353, height: 520)
        .background(
            
        )
        .clipShape(.rect(cornerRadius: 35))
        .padding(.bottom, 80)
    }
}

#Preview {
    CustomRotationView( news: DeveloperPreview.instance.news)
}
