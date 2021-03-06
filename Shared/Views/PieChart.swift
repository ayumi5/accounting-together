//
//  PieChart.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI
import Charts

struct PieChart: UIViewRepresentable {
    var totalExpenseAmount = 0
    var categories = [Category]()
    @Binding var currentMonth: Int
    
    func makeUIView(context: Context) -> PieChartView {
        let pieChart = PieChartView()
        pieChart.data = getData()
        pieChart.legend.enabled = false
        
        return pieChart
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        uiView.data = getData()
    }
    
    private func getData() -> PieChartData {
        let data = PieChartData()
        let entries = convertRecordsToEntries()
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.colors = categories.map { UIColor($0.mainColor) }
        let color: UIColor = .darkGray
        dataSet.entryLabelColor = color
        dataSet.valueLineColor = color
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.allowsFloats = true
        pFormatter.locale = Locale(identifier: "jp_JP")
        dataSet.valueFormatter = (DefaultValueFormatter(formatter: pFormatter))
        dataSet.yValuePosition = .insideSlice
        dataSet.xValuePosition = .insideSlice
        
        data.addDataSet(dataSet)
        data.setValueTextColor(color)
        
        return data
    }
    
    private func convertRecordsToEntries() -> [PieChartDataEntry] {
        var entries: [PieChartDataEntry] = []
        for category in categories {
            let selectedMonth = Month.init(rawValue: currentMonth)!
            let datePredicate = NSPredicate.init("date", fromDate: selectedMonth.firstDay as NSDate, toDate: selectedMonth.lastDay as NSDate)
            let categoryRecords = category.records.filter(datePredicate)
            let categoryTotal = Array(categoryRecords).totalExpenseAmount()
            let percent = (Float(categoryTotal)/Float(totalExpenseAmount))
            // display category name only when there's enough space
            let label = percent > 0.1 ? category.main : ""
            let entry = PieChartDataEntry(value: Double(percent), label: label)
            entries.append(entry)
        }
        return entries
    }
}

struct PieChart_Previews: PreviewProvider {
    @State static var currentYearMonth: Int = 9
    static var previews: some View { 
        PieChart(currentMonth: $currentYearMonth)
    }
}
