//
//  Coordinator View.swift
//  SportNews
//
//  Created by Michael on 9/4/24.
//

//import SwiftUI
//
//struct Coordinator_View: View {
//    
//    @StateObject private var coordinator = Coordinator()
//    
//    var body: some View {
//        NavigationStack(path: $coordinator.path) {
//            coordinator.build(page: .contentView)
//                .navigationDestination(for: Page.self) { page in
//                    coordinator.build(page: page)
//                }
//                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
//                    coordinator.build(fullScreenCover: fullScreenCover)
//                }
//        }
//        .environmentObject(coordinator)
//    }
//}
//
//#Preview {
//    Coordinator_View()
//        .preferredColorScheme(.dark)
//        .environmentObject(DeveloperPreview.instance.newsVM)
//        .environmentObject(DeveloperPreview.instance.mySavedVM)
//}
//
//extension UIViewController {
//    func hideNavigationBar() {
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//
//    func showNavigationBar() {
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//    }
//}
