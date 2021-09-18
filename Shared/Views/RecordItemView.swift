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
    @State var selectedDate = Date()
    @State private var showAlert = false
    private let accounts = [Account(name: "Jasper"), Account(name: "Ayumi")]
    @State var selectedAccount: Account = Account(name: "Jasper")
    @ObservedRealmObject var account: Account  = Account(name: "Jasper")
//    @ObservedRealmObject var account: Account
//    @ObservedRealmObject var accounts: RealmSwift.List<Account>
//    @ObservedRealmObject var selectedCategory: Category
    @State var selectedCategory: Category
    
    private var intFormatter: Formatter = NumberFormatter()
//    private let realm = Realm.myRealm
    
    init() {
        _selectedCategory = State(initialValue: Category(main: "", mainImageName: "", sub: ""))
    }
    
    var body: some View {
        Form {
            HStack {
                Text("¥")
                TextField("10,000", value: $price, formatter: intFormatter)
                    // TODO: how to add toolbar?
//                    .keyboardType(.decimalPad)
            }.padding()
            HStack {
                DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
            }.padding()
//            HStack {
//                Picker("Category", selection: $selectedCategory) {
//                    ForEach($account.catogories, id: \.self) { category in
//                        Text(category.main)
//                    }
//                }.onAppear {
//                    selectedCategory = account.catogories.first!
//                }
//            }.padding()
            HStack {
                Picker("Paid by", selection: $selectedAccount) {
                    ForEach(accounts, id: \.self) { account in
                        Text(account.name)
                    }
                }
            }.padding()
            Button(action: {
//                let realm = Realm.myRealm
//                let record = Record(price: price ?? 0, date: selectedDate, category: selectedCategory, payingAccount: selectedAccount, isReimbursed: false, whoReimnurse: nil)
//                if record.expense == 0 {
//                    showAlert = true
//                } else {
//                    try! realm.write {
//                        realm.add(record)
//                    }
//                    price = nil
//                    selectedDate = Date()
//                    selectedAccount = Account(name: "Jasper")
//                    showAlert = false
//                }
            }) {
                Text("OK")
            }.alert(isPresented: self.$showAlert) {
                Alert(title: Text("Error"), message: Text("Please enter price!"), dismissButton: .default(Text("OK")))
            }.padding()
        }
    }
}

struct RecordItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecordItemView()
    }
}
