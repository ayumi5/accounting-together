//
//  AccountData.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/30.
//

import Foundation
import SwiftUI
import RealmSwift

class Account: EmbeddedObject {
    @Persisted var id: Int
    @Persisted var name: String
    
    convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
}
