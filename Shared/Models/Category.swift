//
//  Category.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/07.
//

import Foundation
import RealmSwift

class Category: EmbeddedObject {
    @Persisted var main: String = ""
    @Persisted var sub: String = ""
    
    convenience init(main: String, sub: String) {
        self.init()
        self.main = main
        self.sub = sub
    }
}
