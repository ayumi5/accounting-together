//
//  ReportView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI

struct ReportView: View {
    let monthYearPicker: some View = MonthYearPicker()
    let pieChart: some View = PieChart()
    var body: some View {
        VStack {
            monthYearPicker
            Text("¥250,000")
                .padding()
                .font(.largeTitle)
            Spacer()
            pieChart
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
