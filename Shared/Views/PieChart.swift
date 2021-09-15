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
        pieChart.data = getData()
        
        return pieChart
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        uiView.data = getData()
    }
    
    private func getData() -> PieChartData {
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
        
        return data
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
        PieChart(records: [])
    }
}
