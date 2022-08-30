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
        NavigationView {
            TabView {
                ListView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("List")
                    }
            }
            
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
