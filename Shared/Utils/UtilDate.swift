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
    
     
}
