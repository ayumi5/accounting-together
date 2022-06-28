//
//  CategoryListItemView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/23.
//

import SwiftUI
import RealmSwift

struct CategoryListItemView: View {
    @ObservedObject var category: Category
    var selectedMonth: Month
    @Binding var showRecord: (category: String, shown: Bool)
    
    var body: some View {
        let datePredicate = NSPredicate("date", fromDate: selectedMonth.firstDay as NSDate, toDate: selectedMonth.lastDay as NSDate)
        let categoryRecords = category.records.filter(datePredicate)
        return    Button(action: {
            showRecord.category = category.main
            showRecord.shown.toggle()
            category.showRecordList.toggle()
        }) {
            HStack {
                if showRecord.category == category.main && showRecord.shown == true {
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.black)
                } else {
                    Image(systemName: "chevron.forward")
                        .foregroundColor(Color.black)
                }
                Rectangle()
                    .fill(category.mainColor)
                    .frame(width: 20, height: 20)
                category.mainImage
                    .resizable()
                    .frame(width: 25, height: 25)
                Text(category.main)
                Spacer()
                Text("¥" + "\(Array(categoryRecords).totalExpenseAmount())")
            }
        }
        .padding()
        .foregroundColor(Color.black)
    }
}
