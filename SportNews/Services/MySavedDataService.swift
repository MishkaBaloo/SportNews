//
//  MySavedDataService.swift
//  SportNews
//
//  Created by Michael on 8/29/24.
//

import Foundation
import CoreData

class MySavedDataService: ObservableObject {
    
    private let container: NSPersistentContainer
    private let containerName: String = "MySavedContainer"
    private let entityName: String = "MySavedEntity"
    @Published var savedEntities: [MySavedEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
            let initialCategory = MySavedCategory(rawValue: UserDefaults.standard.string(forKey: "selectedCategory") ?? MySavedCategory.all.rawValue) ?? .all
            self.getMySaved(for: initialCategory)
        }
    }
    //MARK: PUBLIC SECTION OF FUNC
    
    func saveButtonPressed(news: NewsAPIDataModel) {
        
        // check if news is already in MySaved
        if let entity = savedEntities.first(where: { $0.newsID == news.id }) {
            delete(entity: entity)
        } else {
            add(news: news)
        }
    }
    
    func deleteNewsMySaved(entity: MySavedEntity) {
        if let entity = savedEntities.first(where: { $0.newsID == entity.newsID }) {
            container.viewContext.delete(entity)
            applyChanges()
        }
    }
    
    func clearCache() {
        savedEntities.forEach { news in
            container.viewContext.delete(news)
        }
        applyChanges()
    }
    
    //MARK: PRIVATE SECTION OF FUNC
    
    func getMySaved(for category: MySavedCategory) {
        
        let request = NSFetchRequest<MySavedEntity>(entityName: entityName)
        
        if category != .all {
            request.predicate = NSPredicate(format: "category == %@", category.rawValue)
        }
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching MySaved Entities. \(error)")
        }
    }
    
    private func add(news: NewsAPIDataModel) { // create new entity every time, if we want to change maybe title or body we need to update() func
        let entity = MySavedEntity(context: container.viewContext)
        entity.newsID = news.id
        entity.body = news.body
        entity.dataType = news.dataType
        entity.date = news.date
        entity.image = news.image
        entity.time = news.time
        entity.title = news.title
        entity.url = news.url
        entity.category = selectedCategory(for: news)
    
        applyChanges()
    }
    
    private func selectedCategory(for news: NewsAPIDataModel) -> String {
        
        let title = news.title?.lowercased() ?? ""
        let body = news.body?.lowercased() ?? ""
        
        // Dictionary with key words and their categories
        let categoryKeywords: [String: MySavedCategory] = [
            "soccer": .soccer,
            "basketball": .basketball,
            "baseball": .baseball,
            "cricket": .cricket,
            "football": .amFootball,
            "volleyball": .volleyball,
            "tennis": .tennis,
            "hokey": .iceHokey,
            "rugby": .rugby,
            "boxing": .boxing,
            "golf": .golf
        ]
        
        // Review the dictionary and check if the keyword is in the title or body
        for (keyword, category) in categoryKeywords {
            if title.contains(keyword) || body.contains(keyword) {
                return category.rawValue
            }
        }
        
        // Return "all" as the default category
        return MySavedCategory.all.rawValue
    }
    
      func delete(entity: MySavedEntity) {
        container.viewContext.delete(entity)
          applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getMySaved(for: .all)
    }
}
