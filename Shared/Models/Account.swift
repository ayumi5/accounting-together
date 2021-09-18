//
//  AccountData.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/30.
//

import Foundation
import SwiftUI
import RealmSwift

class Account: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var imageName: String = ""
    @Persisted var records = RealmSwift.List<Record>()
    
    var image: Image {
        Image(systemName: imageName)
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
        self.imageName = "person"
    }
}
