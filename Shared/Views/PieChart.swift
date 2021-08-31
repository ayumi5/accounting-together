//
//  PieChart.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI
import Charts

struct PieChart: UIViewRepresentable {
    var records = [Record]()
    
    func makeUIView(context: Context) -> PieChartView {
        let pieChart = PieChartView()
        let data = PieChartData()
        let entries = convertRecordsToEntries()
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.colors =
            ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + ChartColorTemplates.vordiplom()
        let color: UIColor = .darkGray
        dataSet.entryLabelColor = color
        dataSet.valueLineColor = color
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .currency
        pFormatter.locale = Locale(identifier: "jp_JP")
        dataSet.valueFormatter = (DefaultValueFormatter(formatter: pFormatter))
        dataSet.xValuePosition = .outsideSlice
        dataSet.yValuePosition = .outsideSlice
        
        data.addDataSet(dataSet)
        data.setValueTextColor(color)
        pieChart.data = data
        
        return pieChart
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        // TODO: later
    }
    
    private func convertRecordsToEntries() -> [PieChartDataEntry] {
        var entries: [PieChartDataEntry] = []
        let totalExpense = records.totalExpenseAmount()
        for record in records {
            let percent = (Float(record.expense)/Float(totalExpense))*100
            let entry = PieChartDataEntry(value: Double(record.expense), label: "\(Int(percent.rounded()))%")
            entries.append(entry)
        }
        
        return entries
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        let records = [
            Record(id: 1, category: "Food", imageName: "chart.pie.fill", expense: 51924),
            Record(id: 2, category: "Household items", imageName: "chart.pie.fill", expense: 3270),
            Record(id: 3, category: "Gift", imageName: "chart.pie.fill", expense: 6730),
            Record(id: 4, category: "Utility", imageName: "chart.pie.fill", expense: 2460),
            Record(id: 5, category: "Car", imageName: "chart.pie.fill", expense: 4160),
            Record(id: 6, category: "Gardening", imageName: "chart.pie.fill", expense: 5739)
        ]
        PieChart(records: records)
    }
}
