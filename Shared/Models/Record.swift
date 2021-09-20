//
//  Record.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/07.
//

import Foundation
import RealmSwift
import SwiftUI

class Record: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var expense: Int
    @Persisted var date: Date
    @Persisted var isReimbursed: Bool = false
    @Persisted var whoReimburse: Account?
    @Persisted var note: String = ""
    @Persisted(originProperty: "records") var linkedCategory: LinkingObjects<Category>
    @Persisted(originProperty: "records") var linkedAccount: LinkingObjects<Account>
    
    var category: Category {
        linkedCategory.first!
    }
    
    var payingAccount: Account {
        linkedAccount.first!
    }
    
    convenience init(price: Int, date: Date, isReimbursed: Bool, whoReimnurse: Account?) {
        self.init()
        self.expense = price
        self.date = date
        self.isReimbursed = isReimbursed
        self.whoReimburse = whoReimburse
    }
}

extension Array where Element == Record {
    func totalExpenseAmount() -> Int {
        var total: Int = 0
        _ = self.map { total+=$0.expense }
        return total
    }
}
