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
    private let realm = Realm.myRealm
        
    var body: some View {
        let selectedMonth = Month.init(rawValue: currentYearMonth)!
        let datePredicate = NSPredicate("date", fromDate: selectedMonth.firstDay as NSDate, toDate: selectedMonth.lastDay as NSDate)
        let recordsDatePredicate = NSPredicate("Any records.date", fromDate: selectedMonth.firstDay as NSDate, toDate: selectedMonth.lastDay as NSDate)
        let filteredRecords = Array(records.filter(datePredicate))
        let categories = realm.objects(Category.self).filter(recordsDatePredicate)
        
        return VStack {
            MonthYearPicker(currentYearMonth: $currentYearMonth)
            if filteredRecords.count > 0 {
                Text("\(unit) \(filteredRecords.totalExpenseAmount())")
                    .padding()
                    .font(.title)
                Spacer()
                PieChart(totalExpenseAmount: filteredRecords.totalExpenseAmount(), categories: Array(categories), currentYearMonth: $currentYearMonth)
                    .padding()
                Spacer()
                List(categories, id: \.self) { category in
                    let categoryRecords = category.records.filter(datePredicate)
                    if categoryRecords.count > 0 {
                        HStack {
                            Rectangle()
                                .fill(category.mainColor)
                                .frame(width: 25, height: 25)
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
            } else {
                Spacer()
                Text("No record yet")
                Spacer()
            }
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
