//
//  ReportView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI

struct ReportView: View {
    @State private var currentYearMonth: Int = 0
    
    private let unit: String = "¥"
    private let listHeight:CGFloat = 0.25
    private var records = [[Record]]()
    // TODO: dummy data
    let records_7 = [
        Record(id: 1, category: "Food", imageName: "food", expense: 51924),
        Record(id: 2, category: "Household items", imageName: "household_items", expense: 3270),
        Record(id: 3, category: "Gift", imageName: "gift", expense: 6730),
        Record(id: 4, category: "Utilities", imageName: "utility", expense: 2460),
        Record(id: 5, category: "Car", imageName: "car", expense: 4160),
        Record(id: 6, category: "Gardening", imageName: "gardening", expense: 5739)
    ]
    let records_8 = [
        Record(id: 1, category: "Food", imageName: "food", expense: 43098),
        Record(id: 2, category: "Household items", imageName: "household_items", expense: 342),
        Record(id: 3, category: "Utilities", imageName: "utility", expense: 3000),
        Record(id: 4, category: "Car", imageName: "car", expense: 3098),
        Record(id: 5, category: "Gardening", imageName: "gardening", expense: 6098)
    ]
    let records_9 = [
        Record(id: 1, category: "Food", imageName: "food", expense: 50098),
        Record(id: 2, category: "Household items", imageName: "household_items", expense: 2343),
        Record(id: 3, category: "Utilities", imageName: "utility", expense: 52342),
        Record(id: 4, category: "Car", imageName: "car", expense: 3098),
        Record(id: 5, category: "Gardening", imageName: "gardening", expense: 253)
    ]
    
    init() {
        // TODO: temp
        self.records.append(records_7)
        self.records.append(records_8)
        self.records.append(records_9)
    }
    
    
    var body: some View {
        VStack {
            MonthYearPicker(currentYearMonth: $currentYearMonth)
            Text("\(unit) \(records[currentYearMonth].totalExpenseAmount())")
                .padding()
                .font(.title)
            Spacer()
            PieChart(records: records[currentYearMonth])
            Spacer()
            List(records[currentYearMonth], id: \.self) { record in
                HStack {
                    record.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    Text(record.category)
                    Spacer()
                    Text("\(unit) \(record.expense)")
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
                    if currentYearMonth < 2 {
                        currentYearMonth += 1
                    }
                }
                if value.translation.width > 0 {
                    // right swipe
                    if currentYearMonth > 0 {
                        currentYearMonth -= 1
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
