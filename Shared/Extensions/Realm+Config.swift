//
//  Realm+Config.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/18.
//

import Foundation
import RealmSwift

extension Realm {
    static var myRealm: Realm {
        return try! Realm(configuration: Realm.myConfiguration)
    }
    
    static var myConfiguration: Realm.Configuration {
        var config = Realm.Configuration.defaultConfiguration
        config.fileURL!.deleteLastPathComponent()
        config.fileURL!.appendPathComponent("AccountingTogether")
        config.fileURL!.appendPathExtension("realm")
        return config
    }
}

