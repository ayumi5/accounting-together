//
//  PieChart.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI
import Charts

struct PieChart: UIViewRepresentable {
    func makeUIView(context: Context) -> PieChartView {
        // TODO: change later
        let pieChart = PieChartView()
        let data = PieChartData()
        let pieChartEntries = [
            PieChartDataEntry(value:1, data:2),
            PieChartDataEntry(value:14, data:8),
            PieChartDataEntry(value:40, data:8),
            PieChartDataEntry(value:20, data:8),
            PieChartDataEntry(value:10, data:8)
        ]
        let dataSet = PieChartDataSet(entries: pieChartEntries)
        dataSet.colors = ChartColorTemplates.vordiplom()
                    + ChartColorTemplates.joyful()
                    + ChartColorTemplates.colorful()
                    + ChartColorTemplates.liberty()
                    + ChartColorTemplates.pastel()
                    + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        data.addDataSet(dataSet)
        
        pieChart.data = data
        return pieChart
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart()
    }
}
