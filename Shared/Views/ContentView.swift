//
//  ContentView.swift
//  Shared
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // TODO: dummy data
    let records = [
        Record(id: 1, category: "Food", imageName: "chart.pie.fill", expense: 51924),
        Record(id: 2, category: "Household items", imageName: "chart.pie.fill", expense: 3270),
        Record(id: 3, category: "Gift", imageName: "chart.pie.fill", expense: 6730),
        Record(id: 4, category: "Utility", imageName: "chart.pie.fill", expense: 2460),
        Record(id: 5, category: "Car", imageName: "chart.pie.fill", expense: 4160),
        Record(id: 6, category: "Gardening", imageName: "chart.pie.fill", expense: 5739)
    ]
    var body: some View {
        NavigationView {
            TabView {
                ReportView(records: records)
                    .tabItem {
                        VStack {
                            Image(systemName: "chart.pie.fill")
                            Text("Report")
                        }
                    }
                    .tag(1)
                RecordItemView()
                    .tabItem {
                        VStack {
                            Image(systemName: "pencil")
                            Text("Record")
                        }
                    }
                    .tag(2)
            }
            .navigationTitle("Report")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: SettingsView()) {
                        // TODO: change the button color 
                        Button(action: {
                            
                        }){
                            Image(systemName: "gearshape.fill")
                        }
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
