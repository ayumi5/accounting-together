//
//  ReportView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI
import RealmSwift

struct ReportView: View {
    @State private var currentYear: Int = Date.calendar.component(.year, from: Date())
    @State private var currentMonth: Int = Date.calendar.component(.month, from: Date())
    
    private let unit: String = "¥"
    private let listHeight:CGFloat = 0.3
    @ObservedResults(Record.self) var records
    private let realm = Realm.myRealm
    @State private var showRecord = (category: "", shown: false)
        
    var body: some View {
        let selectedMonth = Month.init(rawValue: currentMonth)!
        let datePredicate = NSPredicate("date", fromDate: selectedMonth.firstDay as NSDate, toDate: selectedMonth.lastDay as NSDate)
        let recordsDatePredicate = NSPredicate("Any records.date", fromDate: selectedMonth.firstDay as NSDate, toDate: selectedMonth.lastDay as NSDate)
        let filteredRecords = Array(records.filter(datePredicate))
        let categories = realm.objects(Category.self).filter(recordsDatePredicate)
        
        return VStack {
            MonthYearPicker(currentYear: $currentYear, currentMonth: $currentMonth)
            if filteredRecords.count > 0 {
                Text("\(unit) \(filteredRecords.totalExpenseAmount())")
                    .padding()
                    .font(.title)
                Spacer()
                PieChart(totalExpenseAmount: filteredRecords.totalExpenseAmount(), categories: Array(categories), currentMonth: $currentMonth)
                    .padding()
                Spacer()
                List(categories, id: \.self) { category in
                    Section(header: CategoryListItemView(category: category, selectedMonth: selectedMonth, showRecord: $showRecord)) {
                        let categoryRecords = category.records.filter(datePredicate).sorted(byKeyPath: "date", ascending: false)
                        if categoryRecords.count > 0 {
                            if showRecord.category == category.main && showRecord.shown {
                                ForEach(categoryRecords) { record in
                                    return HStack {
                                        Text(UtilDate.convertDateToString(record.date, in: "MM/dd HH:mm"))
                                        Text(record.note)
                                        Spacer()
                                        Text("¥" + String(record.expense))
                                    }
                                }
                            }
                        }
                    }
                    .background(Color.white)
                    .listRowInsets(EdgeInsets(top: 0,
                                              leading: 0,
                                              bottom: 0,
                                              trailing: 0))
                }
                .frame(height: UIScreen.height*listHeight)
                .padding()
            } else {
                Text("No record yet")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
            }
        }.gesture(drag)
    }
    
    var drag: some Gesture {
        DragGesture()
            .onEnded({ value in
                if value.translation.width < 0 {
                    // left swipe
                    if currentMonth < 12 {
                        currentMonth += 1
                    }
                }
                if value.translation.width > 1 {
                    // right swipe
                    if currentMonth > 0 {
                        currentMonth -= 1
                    }
                }
            })
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
