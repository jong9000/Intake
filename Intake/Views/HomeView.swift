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
            ZStack {
                LinearGradient(colors: [.red, .blue], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .opacity(0.7)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    CalorieTotalView(title: "today", amount: "1000")
                    CalorieTotalView(title: "yesterday", amount: "2500")
                    CalorieTotalView(title: "day before that", amount: "1900")
                    CalorieTotalView(title: "day before that", amount: "2300")
                }
                .navigationTitle("Home")
            }
        }
    }
    
//    private func totalCaloriesForToday() -> String {
//        var totalCalories: Int16 = 0
//
//        for item in items {
//            totalCalories += item.calories
//        }
//
//        return "\(totalCalories)"
//    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
