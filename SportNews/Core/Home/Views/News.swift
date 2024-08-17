//
//  News.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct News: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, content: {
                Text("Content")
                
                    .navigationTitle("SportNews")
            })
        }
    }
}

#Preview {
    News()
}
