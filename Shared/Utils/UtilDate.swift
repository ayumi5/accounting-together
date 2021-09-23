//
//  UtilDate.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/14.
//

import Foundation

enum Month: Int, Identifiable {
    var id: Self { self }
    
    case Jan = 1
    case Feb
    case Mar
    case Apr
    case May
    case Jun
    case Jul
    case Aug
    case Sep
    case Oct
    case Nov
    case Dec
    
    var firstDay: Date {
        DateComponents(calendar: Date.calendar, year: 2021, month: self.rawValue, day: 1).date!
    }
    
    var lastDay: Date {
        firstDay.endOfMonth()
    }
     
}

class UtilDate {
    static var myDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter
    }
    
    static func convertStringToDate(_ dateStr: String, in format: String?) -> Date? {
        if let myFormat = format {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.dateFormat = myFormat
            return formatter.date(from: dateStr)
        } else {
            return myDateFormatter.date(from: dateStr)
        }
    }
    
    static func convertDateToString(_ date: Date, in format: String?) -> String {
        if let myFormat = format {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.dateFormat = myFormat
            return formatter.string(from: date)
        } else {
            return myDateFormatter.string(from: date)
        }
    }
}
