//
//  ContentView.swift
//  Intake
//
//  Created by Jonathan Gentry on 8/23/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
