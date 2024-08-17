//
//  News.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct News: View {
    
    let textColor: [String:Color] = ["Sports" : .accentThree, "News" : .layerOne]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 15) {
                header
            }
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("SportNews")
//                .background(textColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.accentThree)
            .font(.system(size: 34, weight: .bold, design: .default))
        
            HStack(spacing: 16)  {
                ReloadButton()
                    .onTapGesture {
                        
                    }
                    .padding(-7)
                SearchButton()
                    .onTapGesture {
                        
                    }
                
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 6)
    }
}

#Preview {
    News()
}
