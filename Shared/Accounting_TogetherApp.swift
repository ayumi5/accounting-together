//
//  Accounting_TogetherApp.swift
//  Shared
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI
import Foundation
import RealmSwift

@main
struct Accounting_TogetherApp: SwiftUI.App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        return WindowGroup {
            ContentView()
                .environment(\.realmConfiguration, Realm.myConfiguration)
        }
    }
    
}
