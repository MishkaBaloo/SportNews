//
//  Coordinator.swift
//  SportNews
//
//  Created by Michael on 8/21/24.
//

import SwiftUI

// MARK: enums
enum Page: String, Identifiable {
    case news, mySaved, setting, detail, searchTab
    
    var id: String {
        self.rawValue
    }
}

//enum Sheet: String, Identifiable {
//    case lemon
//    
//    var id: String {
//        self.rawValue
//    }
//}

enum FullScreenCover: String, Identifiable {
    case news, mySaved, setting, detail
    
    var id: String {
        self.rawValue
    }
}

// MARK: Class
class Coordinator: ObservableObject {
    
    @EnvironmentObject private var vm: NewsViewModel
    
    @Published var path = NavigationPath()
//    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    // MARK: functions
    func push(_ page: Page) {
        path.append(page)
    }
    
//    func present(sheet: Sheet) {
//        self.sheet = sheet
//    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
//    func dissmissSheet() {
//        self.sheet = nil
//    }
    
    func dissmissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    //MARK: ViewBuilders
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .news:
            News()
        case .mySaved:
            MySavedView()
        case .setting:
            SettingView()
        case .detail:
            EmptyView()
        case .searchTab:
            SearchTabBarView(searchText: $vm.searchText)
        }
    }
    
//    @ViewBuilder
//    func build(sheet: Sheet) -> some View {
//        switch sheet {
//        case .lemon:
//            NavigationStack {
//                LemonView()
//            }
//        }
//    }
    
//    @ViewBuilder
//    func build(fullScreenCover: FullScreenCover) -> some View {
//        switch fullScreenCover {
//        case .olive:
//            NavigationStack {
//                OliveView()
//            }
//        }
//    }
}
