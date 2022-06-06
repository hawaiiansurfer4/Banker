//
//  Date+Utils.swift
//  Banker
//
//  Created by Sean Murphy on 6/6/22.
//

import Foundation

extension Date {
    static var bankerDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "MDT")
        return formatter
    }
    
    var monthDayYearString: String {
        let dateFormatter = Date.bankerDateFormatter
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
