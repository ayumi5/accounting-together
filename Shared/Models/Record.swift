//
//  Record.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/07.
//

import Foundation
import RealmSwift
import SwiftUI

class Record: Object, Identifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var expense: Int
    @Persisted var date: Date
    @Persisted var category: Category?
    @Persisted var payingAccount: Account?
    @Persisted var isReimbursed: Bool = false
    @Persisted var whoReimburse: Account?
    @Persisted var note: String = ""
    
    private static var realm = try! Realm()
    
    var image: Image {
        Image(category!.mainImageName)
    }
    
    convenience init(price: Int, date: Date, category: Category, payingAccount: Account, isReimbursed: Bool, whoReimnurse: Account?) {
        self.init()
        self.expense = price
        self.date = date
        self.category = category
        self.payingAccount = payingAccount
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

extension Results where Element == Record {
    func filterBy(date: Date) -> Results<Record> {
        return self.filter("date > %@ && date < %@", date.startOfMonth(), date.endOfMonth())
    }
}
