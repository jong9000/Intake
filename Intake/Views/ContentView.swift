//
//  ContentView.swift
//  Intake
//
//  Created by Jonathan Gentry on 8/23/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var fastingTimer = FastingTimerManager()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
            AddView()
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Add")
                }
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        }
        .environmentObject(fastingTimer)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .preferredColorScheme(.dark)
        
    }
}
