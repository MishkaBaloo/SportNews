//
//  MySavedView.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import SwiftUI

struct MySavedView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, content: {
                Text("You haven't saved the news yet...")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundStyle(.layerTwo)
                
                    .navigationTitle("My Saved")
            })
        }
    }
}

#Preview {
    MySavedView()
}
