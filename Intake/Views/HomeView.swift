//
//  HomeView.swift
//  Intake
//
//  Created by Jonathan Gentry on 8/30/22.
//

import SwiftUI

struct HomeView: View {
    
    @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
                predicate: NSPredicate(format: "timestamp > %@", UserCalendar().startOfDay as NSDate),
                  animation: .default)
    private var todaysItems: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.red, .blue], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .opacity(0.7)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    CalorieTotalView(title: "today", amount: totalCaloriesForToday())
                    CalorieTotalView(title: "yesterday", amount: "0")
                    CalorieTotalView(title: "day before that", amount: "0")
                    CalorieTotalView(title: "day before that", amount: "0")
                }
                .navigationTitle("Home")
            }
        }
    }
    
    private func totalCaloriesForToday() -> String {
        var totalCalories: Int16 = 0

        for item in todaysItems {
            totalCalories += item.calories
        }

        return "\(totalCalories)"
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

