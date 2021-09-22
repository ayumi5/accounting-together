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
        // make initial account and categories when not exist
        let realm = Realm.myRealm
        let accounts = realm.objects(Account.self)
        let categories = realm.objects(Category.self)
        if accounts.count == 0 {
            let initialAccounts = [
                Account(name: "Jasper"),
                Account(name: "Ayumi")
            ]
            initialAccounts.forEach { account in
                try! realm.write {
                    realm.add(account)
                }
            }
        }
        if categories.count == 0 {
            let initialCategories = [
                Category(main: "Food", mainImageName: "Food", mainColor: "#D9508AFF", sub: ""),
                Category(main: "Gift", mainImageName: "Gift", mainColor: "#FE9507FF", sub: ""),
                Category(main: "Gardening", mainImageName: "Gardening", mainColor: "#FEF778FF", sub: ""),
                Category(main: "Car", mainImageName: "Car", mainColor: "#6AA786FF", sub: ""),
                Category(main: "Household items", mainImageName: "Household_items", mainColor: "#35C2D1FF", sub: ""),
                Category(main: "Utility", mainImageName: "Utility", mainColor: "#405980FF", sub: "")
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
