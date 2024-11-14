//
//  MySavedDataService.swift
//  SportNews
//
//  Created by Michael on 8/29/24.
//

import Foundation
import CoreData
import SwiftUI

class MySavedDataService: ObservableObject {
    
    private let container: NSPersistentContainer
    private let containerName: String = "MySavedContainer"
    private let entityName: String = "NewsAPIDataEntity"
    @Published var savedEntities: [NewsAPIDataEntity] = []
    
    @AppStorage("selectedCategory") private var selectedCategory: MySavedCategory = .all
    
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
        // Check if news is already saved
        if let entity = savedEntities.first(where: { $0.newsID == news.id }) {
            delete(entity: entity)
        } else {
            add(news: news)
        }
        applyChanges(categoty: .all)
    }
    
    func isNewsSaved(newsID: String) -> Bool {
        return savedEntities.contains { $0.newsID == newsID }
    }
    
    func deleteNewsMySaved(news: NewsAPIDataModel) {
        if let entity = savedEntities.first(where: {$0.newsID == news.id}) {
            delete(entity: entity)
        }
        applyChanges(categoty: selectedCategory)
    }
    
    func clearCache() {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try container.viewContext.execute(deleteRequest)
            savedEntities.removeAll() 
            applyChanges(categoty: .all)
        } catch let error {
            print("Error clearing cache: \(error)")
        }
    }
    
    //MARK: PRIVATE SECTION OF FUNC
    
    func getMySaved(for category: MySavedCategory) {
        
        let request = NSFetchRequest<NewsAPIDataEntity>(entityName: entityName)
        
        if category != .all {
            request.predicate = NSPredicate(format: "category == %@", category.rawValue)
        }
        
        do {
            savedEntities = try container.viewContext.fetch(request)
            
        } catch let error {
            print("Error fetching NewsAPIDataEntity. \(error)")
        }
    }
    
    private func add(news: NewsAPIDataModel) {
        let fetchRequest: NSFetchRequest<NewsAPIDataEntity> = NewsAPIDataEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "newsID == %@", news.id)
        
        do {
            let results = try container.viewContext.fetch(fetchRequest)
            let entity: NewsAPIDataEntity
            
            if let existingEntity = results.first {
                // Update data of news, is news with same ID is already exist
                entity = existingEntity
            } else {
                // Create new entity if news doesn't exist
                entity = NewsAPIDataEntity(context: container.viewContext)
                entity.newsID = news.id
            }
            
            // Update atributes of entity
            entity.body = news.body
            entity.dataType = news.dataType
            entity.date = news.date
            entity.image = news.image
            entity.time = news.time
            entity.title = news.title
            entity.url = news.url
            entity.category = selectedCategory(for: news)
            
            applyChanges(categoty: .all)
            
        } catch {
            print("Failed to fetch or save news entity: \(error)")
        }
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
    
    private func delete(entity: NewsAPIDataEntity) {
        container.viewContext.delete(entity)
        applyChanges(categoty: selectedCategory)
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges(categoty: MySavedCategory) {
        objectWillChange.send() // Update interface
        save()
        getMySaved(for: categoty)
    }
}
