//
//  CategoryView.swift
//  Accounting Together
//
//  Created by Ayumi Udaka on 2021/09/15.
//

import SwiftUI
import RealmSwift

struct CategoryView: View {
    private let realm = Realm.myRealm
    @State private var showingTextField = false
    @State private var newCategory: String = ""
    
    var body: some View {
        Text("Hello World!")
//        let categories = realm.objects(Category.self)
//        VStack {
//            Button(action: {
//                showingTextField = true
//            }, label: {
//                Text("create + ")
//            })
//            List(categories, id: \.self) { category in
//                Text(category.main)
//            }
//            if showingTextField {
//                TextField("New category", text: $newCategory, onCommit: {
//                    showingTextField = false
//                    try! realm.write {
//                        realm.add(Category.init(main: newCategory, mainImageName: newCategory, sub: ""))
//                        newCategory = ""
//                    }
//                })
//                .padding()
//            }
//            Spacer()
//        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
