//
//  MonthYearPicker.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI

struct MonthYearPicker: View {
    @Binding var currnetYearMonth: Int
    
    init(currentYearMonth: Binding<Int>) {
        self._currnetYearMonth = currentYearMonth
    }
    
    var body: some View {
        HStack {
            Button(action: {
                // to previous month
                if currnetYearMonth > 1 {
                    currnetYearMonth -= 1
                }
            }) {
                Image(systemName: "arrowtriangle.backward")
                    .padding()
            }
            Spacer()
            Text("2021 / \(currnetYearMonth)")// TODO: fixed value for now
                .font(.title)
            Spacer()
            Button(action: {
                // to next month
                if currnetYearMonth < 12 {
                    currnetYearMonth += 1
                }
            }) {
                Image(systemName: "arrowtriangle.right")
                    .padding()
            }
        }
    }
}

struct MonthYearPicker_Previews: PreviewProvider {
    @State static var currentYearMonth: Int = 0
    static var previews: some View {
        MonthYearPicker(currentYearMonth: $currentYearMonth)
    }
}
