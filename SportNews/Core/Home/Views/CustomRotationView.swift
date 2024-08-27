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
    
    @State private var selectedNews: NewsAPIDataModel? = nil
    @State private var showDetailView: Bool = false

    var body: some View {
        StackPageView(vm.allNews) { news in
                VStack { // chat news today
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
                    
                        // title
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
                    
                    
                    VStack { // body text
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
                        HStack { // buttons area
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
                            
                                GoToSourceButton()
                                SaveButton()
                                .onTapGesture {
                                    
                                }
                                ShareButton()
                                .padding(.trailing, 6)
                        }
                    }
                   
                }
                .frame(width: 353, height: 520)
                .background(Color.accentOne)
                .clipShape(.rect(cornerRadius: 35))
            }
            .options(.init(
              scaleFactor: -0.03,
              minScale: 0,
              maxStackSize: 3,
              spacingFactor: 0.01,
              alphaFactor: 0.1,
              shadowRadius: 8,
              stackRotateAngel: .pi / 36,
              popAngle: .pi / 4,
              popOffsetRatio: .init(width: -1.45, height: 0.4),
              stackPosition: CGPoint(x: 0, y: 1)
            ))
    }
    
    private func segue(news: NewsAPIDataModel) {
        selectedNews = news
        showDetailView.toggle()
    }
}

#Preview {
    CustomRotationView()
        .environmentObject(DeveloperPreview.instance.newsVM)
}

import UIKit
import Foundation

public extension StackTransformViewOptions {
    enum LayoutRotation: String, CaseIterable {
        case transparent
        case perspective
        case rotary
        case vortex
        case reverse
        case blur
    }

    static func layout(_ layout: LayoutRotation) -> Self {
        switch layout {
        case .transparent:
            return Self(
                scaleFactor: 0.12,
                minScale: 0.0,
                maxStackSize: 4,
                alphaFactor: 0.2,
                bottomStackAlphaSpeedFactor: 10,
                topStackAlphaSpeedFactor: 0.1,
                popAngle: .pi / 10,
                popOffsetRatio: .init(width: -1.45, height: 0.3)
            )
        case .perspective:
            return Self(
                scaleFactor: 0.1,
                minScale: 0.2,
                maxStackSize: 6,
                spacingFactor: 0.08,
                alphaFactor: 0.0,
                perspectiveRatio: 0.3,
                shadowRadius: 5,
                popAngle: .pi / 10,
                popOffsetRatio: .init(width: -1.45, height: 0.3),
                stackPosition: CGPoint(x: 1, y: 0)
            )
        case .rotary:
            return Self(
                scaleFactor: -0.03,
                minScale: 0.2,
                maxStackSize: 3,
                spacingFactor: 0.01,
                alphaFactor: 0.1,
                shadowRadius: 8,
                stackRotateAngel: .pi / 16,
                popAngle: .pi / 4,
                popOffsetRatio: .init(width: -1.45, height: 0.4),
                stackPosition: CGPoint(x: 0, y: 1)
            )
        case .vortex:
            return Self(
                scaleFactor: -0.15,
                minScale: 0.2,
                maxScale: nil,
                maxStackSize: 4,
                spacingFactor: 0,
                alphaFactor: 0.4,
                topStackAlphaSpeedFactor: 1,
                perspectiveRatio: -0.3,
                shadowEnabled: false,
                popAngle: .pi,
                popOffsetRatio: .zero,
                stackPosition: CGPoint(x: 0, y: 1)
            )
        case .reverse:
            return Self(
                scaleFactor: 0.1,
                maxScale: nil,
                maxStackSize: 4,
                spacingFactor: 0.08,
                shadowRadius: 8,
                popAngle: -.pi / 4,
                popOffsetRatio: .init(width: 1.45, height: 0.4),
                stackPosition: CGPoint(x: -1, y: -0.2),
                reverse: true
            )
        case .blur:
            return Self(
                scaleFactor: 0.1,
                maxScale: nil,
                maxStackSize: 7,
                spacingFactor: 0.06,
                topStackAlphaSpeedFactor: 0.1,
                perspectiveRatio: 0.04,
                shadowRadius: 8,
                popAngle: -.pi / 4,
                popOffsetRatio: .init(width: 1.45, height: 0.4),
                stackPosition: CGPoint(x: -1, y: 0),
                reverse: true,
                blurEffectEnabled: true,
                maxBlurEffectRadius: 0.08
            )
        }
    }
}
