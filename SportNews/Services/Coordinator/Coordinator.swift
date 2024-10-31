//
//  Coordinator.swift
//  SportNews
//
//  Created by Michael on 8/21/24.
//

//import SwiftUI
//
//// MARK: enums
//enum Page: String, Identifiable {
//    
//    
//    case contentView, setting, news, mySaved, notifications
//    
//    var id: String {
//        self.rawValue
//    }
//}
//
//enum FullScreenCover: String, Identifiable {
//    case details, mySavedDetails, notifications
//    
//    var id: String {
//        self.rawValue
//    }
//}
//
//// MARK: Class
//class Coordinator: ObservableObject, Observable {
//    
//    @State private var selectedNews: NewsAPIDataModel? = nil
//    @State private var selectedNewsMySaved: MySavedEntity? = nil
//    
//    @Published var path = NavigationPath()
//    @Published var fullScreenCover: FullScreenCover?
//    
//    // MARK: functions
//    func push(_ page: Page) {
//        path.append(page)
//    }
//    
//    func present(fullScreenCover: FullScreenCover) {
//        self.fullScreenCover = fullScreenCover
//    }
//    
//    func pop() {
//        path.removeLast()
//    }
//    
//    func popToRoot() {
//        path.removeLast(path.count)
//    }
//    
//    func dissmissFullScreenCover() {
//        self.fullScreenCover = nil
//    }
//    
//    //MARK: ViewBuilders
//    
//    @ViewBuilder
//    func build(page: Page) -> some View {
//        switch page {
//        case .contentView:
//            ContentView()
//        case .setting:
//            SettingView()
//        case .news:
//            News()
//        case .mySaved:
//            MySavedView()
//        case .notifications:
//            NotificationsView()
//        }
//    }
//    
//    @ViewBuilder
//    func build(fullScreenCover: FullScreenCover) -> some View {
//        switch fullScreenCover {
//        case .details:
////            DetailLoadingView(news: $selectedNews)
//            DetailView(news: selectedNews!)
//        case .mySavedDetails:
//                DetailLoadingViewMySaved(entity: $selectedNewsMySaved)
//        case .notifications:
//            NotificationsView()
//        }
//    }
//}
