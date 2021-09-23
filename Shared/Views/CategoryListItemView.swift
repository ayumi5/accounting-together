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
            //                if showRecord.category != "" && showRecord.category != category.main {
            //                    showRecord.category = category.main
            //                } else {
            //                    showRecord.category = category.main
            //                    showRecord.shown.toggle()
            //                }
            showRecord.category = category.main
            showRecord.shown.toggle()
            category.showRecordList.toggle()
            print("category.showRecordList: \(category.showRecordList)")
        }) {
            HStack {
                if showRecord.category == category.main && showRecord.shown == true {
//                if category.showRecordList {
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

//struct CategoryListItemView_Previews: PreviewProvider {
//    let category = Category(main: "Food", mainImageName: "Food", mainColor: "#D9508AFF", sub: ""),
//    static var previews: some View {
//        CategoryListItemView(category: category)
//    }
//}
