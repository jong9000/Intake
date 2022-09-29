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
                    CalorieTotalView(title: "today", amount: totalCaloriesForToday())
                    CalorieTotalView(title: "yesterday", amount: totalCaloriesForYesterday())
                    CalorieTotalView(title: "day before that", amount: totalCaloriesForDayBeforeYesterday())
                    CalorieTotalView(title: "day before that", amount: totalCaloriesForDayBeforeDayBeforeYesterday())
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
    
    private func totalCaloriesForYesterday() -> String {
        var totalCalories: Int16 = 0
        
        for item in yesterdaysItems {
            totalCalories += item.calories
        }
        return "\(totalCalories)"
    }
    
    private func totalCaloriesForDayBeforeYesterday() -> String {
        var totalCalories: Int16 = 0
        
        for item in dayBeforeYesterdaysItems {
            totalCalories += item.calories
        }
        return "\(totalCalories)"
    }
    
    private func totalCaloriesForDayBeforeDayBeforeYesterday() -> String {
        var totalCalories: Int16 = 0
        
        for item in dayBeforeDayBeforeYesterdaysItems {
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

struct IntakePredicate {
    static let fromToday = NSPredicate(format: "timestamp >= %@", UserCalendar().startOfDay as NSDate)
    static let tilToday = NSPredicate(format: "timestamp < %@", UserCalendar().startOfDay as NSDate)
    static let fromYesterday = NSPredicate(format: "timestamp > %@", UserCalendar().startOfYesterday as NSDate)
    static let tilYesterday = NSPredicate(format: "timestamp < %@", UserCalendar().startOfYesterday as NSDate)
    static let fromDayBeforeYesterday = NSPredicate(format: "timestamp > %@", UserCalendar().startOfDayBeforeYesterday as NSDate)
    static let tilDayBeforeYesterday = NSPredicate(format: "timestamp < %@", UserCalendar().startOfDayBeforeYesterday as NSDate)
    static let fromDayBeforeDayBeforeYesterday = NSPredicate(format: "timestamp > %@", UserCalendar().startOfDayBeforeDayBeforeYesterday as NSDate)
}
