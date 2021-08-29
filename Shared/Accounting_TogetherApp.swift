//
//  Accounting_TogetherApp.swift
//  Shared
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI

@main
struct Accounting_TogetherApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
