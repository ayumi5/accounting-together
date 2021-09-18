//
//  SettingsView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/02.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            NavigationLink(
                destination: AccountView(),
                label: {
                    Text("Account")
                })
            NavigationLink(
                destination: CategoryView(),
                label: {
                    Text("Category")
                })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
