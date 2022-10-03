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
                predicate: IntakePredicate.fromToday,
                  animation: .default)
    private var todaysItems: FetchedResults<Item>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [IntakePredicate.fromYesterday, IntakePredicate.tilToday]),
animation: .default)
    private var yesterdaysItems: FetchedResults<Item>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [IntakePredicate.fromDayBeforeYesterday, IntakePredicate.tilYesterday]),
animation: .default)
    private var dayBeforeYesterdaysItems: FetchedResults<Item>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
        predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [IntakePredicate.fromDayBeforeDayBeforeYesterday, IntakePredicate.tilDayBeforeYesterday]),
animation: .default)
    private var dayBeforeDayBeforeYesterdaysItems: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.red, .blue], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .opacity(0.7)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    FastingTimerView()
                    CalorieTotalView(title: "today", amount: totalCaloriesForItems(in: todaysItems))
                    CalorieTotalView(title: "yesterday", amount: totalCaloriesForItems(in: yesterdaysItems))
                    CalorieTotalView(title: "day before that", amount: totalCaloriesForItems(in: dayBeforeYesterdaysItems))
                    CalorieTotalView(title: "day before that", amount: totalCaloriesForItems(in: dayBeforeDayBeforeYesterdaysItems))
                }
                .navigationTitle("Home")
            }
        }
    }
    
    private func totalCaloriesForItems(in itemResult: FetchedResults<Item>) -> String {
        var totalCalories: Int16 = 0
        for item in itemResult {
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
