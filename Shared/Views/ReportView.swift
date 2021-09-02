//
//  ReportView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI

struct ReportView: View {
    var records = [Record]()
    let monthYearPicker: some View = MonthYearPicker()
    private let unit: String = "¥"
    private let listHeight:CGFloat = 0.25
    
    var body: some View {
        VStack {
            monthYearPicker
            Text("\(unit) \(records.totalExpenseAmount())")
                .padding()
                .font(.largeTitle)
            Spacer()
            PieChart(records: records)
            Spacer()
            List(records, id: \.self) { record in
                HStack {
                    record.image
                    Text(record.category)
                    Spacer()
                    Text("\(unit) \(record.expense)")
                }
            }
            .frame(height: UIScreen.height*listHeight)
            .padding()
         }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        let records = [
            Record(id: 1, category: "Food", imageName: "chart.pie.fill", expense: 51924),
            Record(id: 2, category: "Household items", imageName: "chart.pie.fill", expense: 3270),
            Record(id: 3, category: "Gift", imageName: "chart.pie.fill", expense: 6730),
            Record(id: 4, category: "Utility", imageName: "chart.pie.fill", expense: 2460),
            Record(id: 5, category: "Car", imageName: "chart.pie.fill", expense: 4160),
            Record(id: 6, category: "Gardening", imageName: "chart.pie.fill", expense: 5739)
        ]
        ReportView(records: records)
    }
}
