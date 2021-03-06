//
//  Category.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/07.
//

import Foundation
import SwiftUI
import RealmSwift

class Category: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var main: String = ""
    @Persisted var mainImageName: String = ""
    @Persisted var mainColorHex: String = ""
    @Persisted var sub: String = ""
    @Persisted var records = RealmSwift.List<Record>()
    
    var mainImage: Image {
        Image(mainImageName)
    }
    
    var mainColor: Color {
        Color.init(hex: mainColorHex)
    }
    
    @Published var showRecordList: Bool = false
    
    convenience init(main: String, mainImageName: String, mainColor: String, sub: String) {
        self.init()
        self.main = main
        self.mainImageName = mainImageName
        self.mainColorHex = mainColor
        self.sub = sub
    }
}
