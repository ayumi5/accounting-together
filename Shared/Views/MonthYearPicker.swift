//
//  MonthYearPicker.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI

struct MonthYearPicker: View {
    @Binding var currentYear: Int
    @Binding var currnetMonth: Int
    
    init(currentYear: Binding<Int>, currentMonth: Binding<Int>) {
        self._currentYear = currentYear
        self._currnetMonth = currentMonth
    }
    
    var body: some View {
        HStack {
            Button(action: {
                // to previous month
                if currnetMonth > 1 {
                    currnetMonth -= 1
                }
            }) {
                Image(systemName: "arrowtriangle.backward")
                    .padding()
            }
            Spacer()
            Text("\(String(currentYear)) / \(currnetMonth)")
                .font(.title)
            Spacer()
            Button(action: {
                // to next month
                if currnetMonth < 12 {
                    currnetMonth += 1
                }
            }) {
                Image(systemName: "arrowtriangle.right")
                    .padding()
            }
        }
    }
}

struct MonthYearPicker_Previews: PreviewProvider {
    @State static var currentYear: Int = 2022
    @State static var currentMonth: Int = 0
    static var previews: some View {
        MonthYearPicker(currentYear: $currentYear, currentMonth: $currentMonth)
    }
}
