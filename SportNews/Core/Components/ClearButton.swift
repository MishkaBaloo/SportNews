//
//  ClearButton.swift
//  SportNews
//
//  Created by Michael on 8/19/24.
//

    import SwiftUI

    struct ClearButton: View {
        
        private let dataService = MySavedDataService()
        @State private var showAlert: Bool = false

        let iconName: String = "trash"

        var body: some View {
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Image(systemName: "trash")
                        .font(.title)
                        .foregroundStyle(.systemOne)
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .stroke(.layerOne, lineWidth: 1)
                                .fill(Color.black)
                        )
                })
//                .alert("Clear Data", isPresented: $showAlert, actions: {
//                    Button(role: .cancel, action: {}) {
//                        Text("Cancel")
//                    }
//                    Button(role: .destructive, action: {
////                        dataService.deleteSavedNews(entity: dataService.savedEntities)
//                    }) {
//                        Text("Clear")
//                    }
//                }, message: {
//                    Text("Do you really want to clear the data?Saved articles will be lost.")
//                })
        }
    }


    #Preview {
        ClearButton()
            .preferredColorScheme(.dark)
    }
