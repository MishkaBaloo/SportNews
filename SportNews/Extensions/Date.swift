//
//  Date.swift
//  SportNews
//
//  Created by Michael on 8/31/24.
//

import Foundation

extension Date {
    
    // "2021-03-13T20:49:26.606Z"
    init(newsDateString: String) {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formater.date(from: newsDateString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormater: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortFormater.string(from: self)
    }
    
}
