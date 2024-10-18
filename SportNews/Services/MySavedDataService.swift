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
            self.getMySaved()
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
            applyChanges()
        }
    }
    
    //MARK: PRIVATE SECTION OF FUNC
    
     func getMySaved() {
        let request = NSFetchRequest<MySavedEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching MySaved Enitities. \(error)")
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
        applyChanges()
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
        getMySaved()
    }
}
