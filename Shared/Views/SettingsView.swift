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
                destination: AccountRegistrationView(),
                label: {
                    Text("Account")
                })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
