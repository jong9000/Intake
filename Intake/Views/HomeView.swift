//
//  HomeView.swift
//  Intake
//
//  Created by Jonathan Gentry on 8/30/22.
//

import SwiftUI

struct HomeView: View {
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
                  animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            VStack {
                Text(totalCaloriesForToday())
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Home")
        }
    }
    
    private func totalCaloriesForToday() -> String {
        var totalCalories: Int16 = 0
        
        for item in items {
            totalCalories += item.calories
        }
        
        return "\(totalCalories)"
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

