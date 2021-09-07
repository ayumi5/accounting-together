//
//  Record.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/07.
//

import Foundation
import RealmSwift

class Record: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var price: Int
    @Persisted var date: Date
    @Persisted var category: Category?
    @Persisted var payingAccount: Account?
    @Persisted var isReimbursed: Bool = false
    @Persisted var whoReimburse: Account?
    
    
    convenience init(price: Int, date: Date, category: Category, payingAccount: Account, isReimbursed: Bool, whoReimnurse: Account?) {
        self.init()
        self.price = price
        self.date = date
        self.category = category
        self.payingAccount = payingAccount
        self.isReimbursed = isReimbursed
        self.whoReimburse = whoReimburse
    }
}
