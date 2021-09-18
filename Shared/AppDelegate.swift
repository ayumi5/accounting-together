//
//  AppDelegate.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/16.
//

import Foundation
import RealmSwift
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("AppDelegate 呼ばれた")
        // make initial account and categories when not exist
        let realm = Realm.myRealm
        let accounts = realm.objects(Account.self)
        let categories = realm.objects(Category.self)
        if accounts.count == 0 {
            let account = Account(name: "Jasper")
            try! realm.write {
                realm.add(account)
            }
        }
        if categories.count == 0 {
            let initialCategories = [
                Category(main: "Food", mainImageName: "Food", sub: ""),
                Category(main: "Gift", mainImageName: "Gift", sub: ""),
                Category(main: "Gardening", mainImageName: "Gardening", sub: ""),
                Category(main: "Car", mainImageName: "Car", sub: ""),
                Category(main: "Household items", mainImageName: "Househole_items", sub: "")
            ]
            initialCategories.forEach { category in
                try! realm.write {
                    realm.add(category)
                }
            }
        }
        return true
    }
}
