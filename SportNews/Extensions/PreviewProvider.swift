//
//  PreviewProvider.swift
//  SportNews
//
//  Created by Michael on 8/17/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPriview {
        return DeveloperPriview.instance
    }
    
}

class DeveloperPriview {
    
    static let instance = DeveloperPriview()
    
    private init() { }
    
    
//    let news = Articles(
//        uri: "7546825937",
//        lang: "eng",
//        isDuplicate: false,
//        date: "2023-05-16",
//        time: "10:35:00",
//        dateTime: "2023-05-16T10:35:00Z",
//        dateTimePub: "2023-05-16T10:34:00Z",
//        dataType: "news",
//        sim: 0,
//        url: "https://www.rmol.co/20230516/22538-tesla-changed-a-deadline-for-investor-proposals-angering-activists/",
//        title: "Tesla Changed A Deadline For Investor Proposals, Angering Activists | RMOL",
//        body: "Tesla investors will have fewer opportunities to express discontent with management at the company's annual meeting, which is taking place Tuesday in Austin, Texas, (trimmed) ...",
//        source: nil,
//        image: "https://www.rmol.co/wp-content/uploads/2023/05/16tesla-fckq-facebookJumbo-4859007.jpg",
//        sentiment: 0.01960784313725483,
//        wgt: 421929300,
//        relevance: 100,
//        metaItem: "other concepts...",
//        currentNews: 1
//    )
    
    let news = NewsAPIDataModel(
        uri: "7546825937",
        lang: "eng",
        isDuplicate: false,
        date: "2023-05-16",
        time: "10:35:00",
        dateTime: "10:35:00",
        dateTimePub: "2023-05-16T10:35:00Z",
        dataType: "news",
        sim: 0,
        url: "https://www.rmol.co/20230516/22538-tesla-changed-a-deadline-for-investor-proposals-angering-activists/",
        title: "Tesla Changed A Deadline For Investor Proposals, Angering Activists | RMOL",
        body: "Tesla investors will have fewer opportunities to express discontent with management at the company's annual meeting, which is taking place Tuesday in Austin, Texas, (trimmed) ...",
//        image: "https://www.rmol.co/wp-content/uploads/2023/05/16tesla-fckq-facebookJumbo-4859007.jpg",
        image: "https://letsenhance.io/static/03620c83508fc72c6d2b218c7e304ba5/11499/UpscalerAfter.jpg",
        sentiment: 0.01960784313725483,
        wgt: 421929300,
        relevance: 100,
        metaItem: "other concepts..."
    )
}
