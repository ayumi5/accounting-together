//
//  Record.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/30.
//

import Foundation
import SwiftUI

struct Record: Hashable {
    var id: Int
    var category: String
    var imageName: String
    var expense: Int
    
    var image: Image {
        Image(systemName: imageName)
    }
}

extension Array where Element == Record {
    func totalExpenseAmount() -> Int {
        var total: Int = 0
        _ = self.map { total+=$0.expense }
        return total
    }
}