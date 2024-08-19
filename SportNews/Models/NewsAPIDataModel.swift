//
//  NewsAPIDataModel.swift
//  SportNews
//
//  Created by Michael on 8/19/24.
//

import Foundation

/*
 {
   "articles": {
     "results": [
       {
         "uri": "7546825937",
         "lang": "eng",
         "isDuplicate": false,
         "date": "2023-05-16",
         "time": "10:35:00",
         "dateTime": "2023-05-16T10:35:00Z",
         "dateTimePub": "2023-05-16T10:34:00Z",
         "dataType": "news",
         "sim": 0,
         "url": "https://www.rmol.co/20230516/22538-tesla-changed-a-deadline-for-investor-proposals-angering-activists/",
         "title": "Tesla Changed A Deadline For Investor Proposals, Angering Activists | RMOL",
         "body": "Tesla investors will have fewer opportunities to express discontent with management at the company's annual meeting, which is taking place Tuesday in Austin, Texas, (trimmed) ...",
         "source": {
           "uri": "rmol.co",
           "dataType": "news",
           "title": "rmol.co"
         },
         "authors": [],
         "concepts": [
           {
             "uri": "http://en.wikipedia.org/wiki/Tesla,_Inc.",
             "type": "org",
             "score": 5,
             "label": {
               "eng": "Tesla, Inc."
             }
           },
           {
             "uri": "http://en.wikipedia.org/wiki/Shareholder",
             "type": "wiki",
             "score": 4,
             "label": {
               "eng": "Shareholder"
             }
           },
           {
             "uri": "http://en.wikipedia.org/wiki/Automotive_industry",
             "type": "wiki",
             "score": 3,
             "label": {
               "eng": "Automotive industry"
             }
           },
           {
             "uri": "http://en.wikipedia.org/wiki/Austin,_Texas",
             "type": "loc",
             "score": 3,
             "label": {
               "eng": "Austin, Texas"
             },
             "location": {
               "type": "place",
               "label": {
                 "eng": "Austin, Texas"
               },
               "country": {
                 "type": "country",
                 "label": {
                   "eng": "United States"
                 }
               }
             }
           },
           {
             "#META ITEM": "other concepts..."
           }
         ],
         "image": "https://www.rmol.co/wp-content/uploads/2023/05/16tesla-fckq-facebookJumbo-4859007.jpg",
         "eventUri": null,
         "shares": {},
         "sentiment": 0.01960784313725483,
         "wgt": 421929300,
         "relevance": 100
       },
       {
         "#META ITEM": "other articles..."
       }
     ],
     "totalResults": 38246,
     "page": 1,
     "count": 100,
     "pages": 383
   }
 }
 */



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
//struct Welcome {
//    let articles: NewsDataModel?
//}
//
//// MARK: - Articles
//struct NewsDataModel {
//    let results: [Result]?
//    let totalResults, page, count, pages: Int?
//}


// MARK: - Result
struct NewsAPIDataModel: Decodable {
////    let id: String?
//    let uri: String?
//    let time: String?
//    let date: String? //
//    let dataType: String? //
//    let url: String? //
//    let title: String? //
//    let body: String? //
////    let source: Source?
//    let image: String? //
    
        let uri, lang: String?
        let isDuplicate: Bool?
        let date, time: String?
        let dateTime, dateTimePub: String?
        let dataType: String?
        let sim: Int?
        let url: String?
        let title, body: String?
//        let source: Source?
//        let authors: [Any?]?
//        let concepts: [Concept]?
        let image: String?
//        let eventURI: NSNull?
//        let shares: Shares?
        let sentiment: Double?
        let wgt, relevance: Int?
        let metaItem: String?
    
//    enum CodingKeys: String, CodingKey {
//        case uri, time, date, dataType, url, title, body, image
//    }
    
    
    
//    func updateNews(amount: Int) -> NewsAPIDataModel {
//        return NewsAPIDataModel(uri: uri, time: time, date: date, dataType: dataType, url: url, title: title, body: body, image: image)
//    }
}

// MARK: - Concept
//struct Concept {
//    let uri: String?
//    let type: String?
//    let score: Int?
////    let label: Label?
////    let location: Location?
//    let metaItem: String?
//}

// MARK: - Label
//struct Label {
//    let eng: String?
//}

// MARK: - Location
//struct Location {
//    let type: String?
//    let label: Label?
//    let country: Country?
//}

// MARK: - Country
//struct Country {
//    let type: String?
//    let label: Label?
//}

// MARK: - Shares
//struct Shares {
//}

// MARK: - Source
//struct Source {
//    let uri, dataType, title: String?
//}
