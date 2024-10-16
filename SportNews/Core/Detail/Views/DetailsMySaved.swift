//
//  DetailsMySaved.swift
//  SportNews
//
//  Created by Michael on 10/16/24.
//

import SwiftUI

struct DetailLoadingViewMySaved: View {
    
    @EnvironmentObject private var coordinator: Coordinator

    
    @Binding var entity: MySavedEntity?
    
    var body: some View {
        ZStack{
            if let entity = entity {
                DetailViewMySaved(entity: entity)
            }
        }
    }
}


struct DetailViewMySaved: View {
    
    let entity: MySavedEntity
    
    @Environment(\.dismiss) var presentationMode
    
    var url: String { entity.url! }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // background layer
                Color.red
                    .ignoresSafeArea()
                
                // content layer
                VStack {
                    
                    HStack {
                        Button(action: {
                            presentationMode.callAsFunction()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundStyle(.black)
                                .frame(width: 50, height: 50)
                                .background(
                                    Circle()
                                        .foregroundStyle(Color.white.opacity(0.5))
                                )
                        })
                        Spacer()
                        
                        // go tu source button
                        Link(destination: URL(string: url)!, label: {
                            Image(systemName: "shazam.logo")
                                .font(.title)
                                .foregroundStyle(.black)
                                .frame(width: 50, height: 50)
                                .background(
                                    Circle()
                                        .foregroundStyle(Color.white.opacity(0.5))
                                )
                        })
                        
                        SaveButton()
                        
                        if let url = URL(string: url) {
                            ShareLink(item: url) {
                                
                                Image(systemName: "square.and.arrow.up")
                                    .font(.title)
                                    .foregroundStyle(.black)
                                    .frame(width: 50, height: 50)
                                    .padding(.bottom, 6)
                                    .background(
                                        Circle()
                                            .foregroundStyle(Color.white.opacity(0.5))
                                    )
                            }
                        }
                    }
                    .padding()
                    
                    VStack {
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.backgroudOne)
                                .overlay {
                                    Text("CHAT News Today")
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundStyle(.layerOne)
                                }
                                .frame(width: 100, height: 20)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        .padding(.bottom, 6)
                        
                        HStack {
                            if let title = entity.title {
                                Text(title)
                                    .frame(width: 313, height: 128, alignment: .leading)
                                    .foregroundStyle(.backgroudOne)
                                    .font(.system(size: 26, weight: .bold))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                        
                        HStack {
                            HStack {
                                
                                if let date = entity.date {
                                    Text(date)
                                }
                                Text("•")
                                
                                if let time = entity.time {
                                    Text(time)
                                }
                            }
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.layerSix)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                            
                        }
                    }
                    ScrollView {
                        VStack {
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
                            .frame(width: 353, height: 200)
                            .clipShape(.rect(cornerRadius: 25))
                            
                            VStack {
                                if let body = entity.body {
                                    Text(body)
                                        .lineSpacing(2)
                                        .frame(width: 353, alignment: .center)
                                        .foregroundStyle(.backgroudThree)
                                        .font(.system(size: 14, weight: .light))
                                }
                            }
                            .padding(.top, 8)
                        }
                        .scrollIndicators(.hidden)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

//#Preview {
//    DetailViewMySaved(entity: DeveloperPreview.instance.entity)
//}
