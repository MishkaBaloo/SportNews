//
//  Articles.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import Foundation

// SportNews API info
/*
 
 URL: https://eventregistry.org/api/v1/event/getEvents
 
 JSON Response:
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

// MARK: - Articles
struct Articles: Identifiable {
    let id: String
    let uri, lang: String
    let isDuplicate: Bool?
    let date, time: String?
    let dateTime, dateTimePub: String?
    let dataType: String?
    let sim: Int?
    let url: String?
    let title, body: String?
    let source: Source?
    let image: String?
    let sentiment: Double?
    let wgt, relevance: Int?
    let metaItem: String?
    let currentNews: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case uri = "uri"
        case lang = "lang"
        case isDuplicate = "isDuplicate"
        case date = "date"
        case time = "time"
        case dateTime = "dateTime"
        case dateTimePub = "dateTimePub"
        case dataType = "dataType"
        case sim = "sim"
        case url = "url"
        case titlle = "title"
        case body = "body"
        case source = "source"
        case image = "image"
        case sentiment = "sentiment"
        case wgt = "wgt"
        case relevance = "relevance"
        case currentNews
        case metaItem = "#META ITEM"
    }
    
    func updateNews(amount: Int) -> Articles {
        return Articles( id: id, uri: uri, lang: lang, isDuplicate: isDuplicate, date: date, time: time, dateTime: dateTime, dateTimePub: dateTimePub, dataType: dataType, sim: sim, url: url, title: title, body: body, source: source, image: image, sentiment: sentiment, wgt: wgt, relevance: relevance, metaItem: metaItem, currentNews: amount)
    }
    
}

// MARK: - Label
struct Label {
    let eng: String?
}

// MARK: - Location
struct Location {
    let type: String?
    let label: Label?
    let country: Country?
}

// MARK: - Country
struct Country {
    let type: String?
    let label: Label?
}


// MARK: - Source
struct Source {
    let uri, dataType, title: String?
}
