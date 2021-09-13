//
//  RecordItemView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI
import RealmSwift

struct RecordItemView: View {
    @State private var price: Int? = nil
    @State private var priceStr: String = ""
    @State var selectedDate = Date()
    @State private var category = ""
    @State private var paidBy = ""
    @State private var showAlert = false

    private var intFormatter: Formatter = NumberFormatter()
    
    var body: some View {
        Form {
            HStack {
                Text("¥")
                TextField("10,000", value: $price, formatter: intFormatter)
                    // TODO: how to add toolbar?
//                    .keyboardType(.decimalPad)
            }
            HStack {
                DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
            }
            HStack {
                Text("Category")
                Spacer()
                TextField("Food", text: $category)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Text("Paid by")
                Spacer()
                TextField("Jasper", text: $paidBy)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: {
                let realm = try! Realm()
                let record = Record(price: price ?? 0, date: selectedDate, category: Category(main: category, sub: ""), payingAccount: Account(id: 1, name: paidBy), isReimbursed: false, whoReimnurse: nil)
                if record.price == 0 {
                    showAlert = true
                } else {
                    try! realm.write {
                        realm.add(record)
                    }
                    price = nil
                    selectedDate = Date()
                    category = ""
                    paidBy = ""
                    showAlert = false
                }
            }) {
                Text("OK")
            }.alert(isPresented: self.$showAlert) {
                Alert(title: Text("Error"), message: Text("Please enter price!"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct RecordItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecordItemView()
    }
}
