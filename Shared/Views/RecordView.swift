//
//  RecordView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/16.
//

import SwiftUI
import RealmSwift
import Combine

struct RecordView: View {
    @ObservedResults(Category.self) var categories
    @ObservedResults(Account.self) var accounts
    @State var currentCategory: Category
    @State var currentAccount: Account
    @State private var price: Int = 0
    @State private var selectedDate = Date()
    @State private var showAlert = false
    
    var body: some View {
        Form {
            HStack {
                Text("¥")
                TextField("10,000", value: $price, formatter: NumberFormatter()
                )
                    // TODO: how to add toolbar?
//                    .keyboardType(.decimalPad)
            }.padding()
            
            HStack {
                DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
            }.padding()
            
            HStack {
                Picker("Category", selection: $currentCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category.main)
                    }
                }
            }.padding()
            
            HStack {
                Picker("Paid by", selection: $currentAccount) {
                    ForEach(accounts, id:\.self) { account in
                        Text(account.name)
                    }
                }
            }.padding()
            
            Button(action: {
                let record = Record(price: price, date: selectedDate, isReimbursed: false, whoReimnurse: nil)
                if record.expense == 0 {
                    showAlert = true
                    // show the alert if no price is entered
                } else {
                    try! Realm.myRealm.write {
                        if let thawedCategory = currentCategory.thaw(), let thawedAccount = currentAccount.thaw() {
                            Realm.myRealm.add(record)
                            thawedCategory.records.append(record)
                            thawedAccount.records.append(record)
                        }
                    }

                    clearForm()
                }
            }) {
                Text("OK")
            }.alert(isPresented: self.$showAlert) {
                Alert(title: Text("Error"), message: Text("Please enter price!"), dismissButton: .default(Text("OK")))
            }.padding()
        }
    }
    
    /// clear data the user entered
    private func clearForm() {
        price = 0
        selectedDate = Date()
        currentCategory = categories.first!
        currentAccount = accounts.first!
        showAlert = false
    }
}

//struct RecordView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecordView()
//    }
//}