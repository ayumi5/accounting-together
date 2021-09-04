//
//  ContentView.swift
//  Shared
//
//  Created by Ayumi Udaka on 2021/08/29.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                ReportView()
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
