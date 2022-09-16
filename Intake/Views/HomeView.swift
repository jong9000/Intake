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
            ScrollView {
                Spacer()
                VStack {
                    Text("Calories for Today")
                        .font(.title)
                        .padding(24)
                    Text(totalCaloriesForToday())
                        .font(.largeTitle)
                    Spacer()
                }
                .frame(width: 300, height: 160, alignment: .center)
                .background(Gradient(colors: [.red, .blue]))
                .cornerRadius(20)
                
                
                VStack {
                    Text("Calories Yesterday")
                        .font(.title)
                        .padding(24)
                    Text("2000")
                        .font(.largeTitle)
                    Spacer()
                }
                .frame(width: 300, height: 160, alignment: .center)
                .background(Gradient(colors: [.red, .blue]))
                .cornerRadius(20)

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

