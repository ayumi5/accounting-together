//
//  RecordItemView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI
import RealmSwift

struct RecordItemView: View {
    var body: some View {
        VStack {
            Text("Record Item")
            Spacer()
            Button(action: {
            }, label: {
                Text("OK")
            })
        }
    }
}

struct RecordItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecordItemView()
    }
}
