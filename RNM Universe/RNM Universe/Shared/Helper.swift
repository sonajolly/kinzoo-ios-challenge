//
//  Helper.swift
//  RNM Universe
//
//  Created by Sona Maria Jolly on 28/10/23.
//

import Foundation

struct Helper {
    // Get Date from string to specific format to show in UI
    static func getDate(from publishedDate: String) -> String {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            if let date = dateFormatter.date(from: publishedDate) {
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "dd MMM yyyy"
                let formattedDate = outputFormatter.string(from: date)
                return formattedDate
            } else {
                return publishedDate
            }
    }
}

