//
//  ReportView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI
import RealmSwift

struct ReportView: View {
    @State private var currentYearMonth: Int = Date.calendar.component(.month, from: Date())
    
    private let unit: String = "¥"
    private let listHeight:CGFloat = 0.25
    @ObservedResults(Record.self) var records
    var account = Account(name: "")
    private let realm = Realm.myRealm
        
    var body: some View {
        let filteredRecords = Array(records.filterBy(date: Month.init(rawValue: currentYearMonth)!.firstDay))
        let categories = realm.objects(Category.self)
        return VStack {
            MonthYearPicker(currentYearMonth: $currentYearMonth)
            Text("\(unit) \(filteredRecords.totalExpenseAmount())")
                .padding()
                .font(.title)
            Spacer()
            PieChart(records: filteredRecords)
            Spacer()
            List(categories, id: \.self) { category in
                let categoryRecords = category.records.filterBy(date: Month.init(rawValue: currentYearMonth)!.firstDay)
                if categoryRecords.count > 0 {
                    HStack {
                        category.mainImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                        Text(category.main)
                        Spacer()
                        Text(unit + "\(Array(categoryRecords).totalExpenseAmount())")
                    }
                }
            }
            .frame(height: UIScreen.height*listHeight)
            .padding()
        }.gesture(drag)
    }
    
    var drag: some Gesture {
        DragGesture()
            .onEnded({ value in
                if value.translation.width < 0 {
                    // left swipe
                    if currentYearMonth < 12 {
                        currentYearMonth += 1
                    }
                }
                if value.translation.width > 1 {
                    // right swipe
                    if currentYearMonth > 0 {
                        currentYearMonth -= 1
                    }
                }
            })
    }
}

//struct ReportView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReportView(recordss: [])
//    }
//}
