//
//  MonthYearPicker.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI

struct MonthYearPicker: View {
    var body: some View {
        HStack {
            Image(systemName: "arrowtriangle.backward")
                .padding()
            Spacer()
            Text("2021 / 7")// TODO: fix value for now
                .font(.title)
            Spacer()
            Image(systemName: "arrowtriangle.right")
                .padding()
        }
    }
}

struct MonthYearPicker_Previews: PreviewProvider {
    static var previews: some View {
        MonthYearPicker()
    }
}
