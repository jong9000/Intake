//
//  UserCalendar.swift
//  Intake
//
//  Created by Jonathan Gentry on 9/17/22.
//

import Foundation

struct UserCalendar {
    private let currentDate = Date()
    private let userCalendar = Calendar.current

    var startOfDay: Date {
        userCalendar.startOfDay(for: currentDate)
    }
    
    var startOfYesterday: Date {
        userCalendar.startOfDay(for: userCalendar.date(byAdding: .day, value: -1, to: currentDate)!)
    }
    
    var startOfDayBeforeYesterday: Date {
        userCalendar.startOfDay(for: userCalendar.date(byAdding: .day, value: -2, to: currentDate)!)
    }
    
    var startOfDayBeforeDayBeforeYesterday: Date {
        userCalendar.startOfDay(for: userCalendar.date(byAdding: .day, value: -3, to: currentDate)!)
    }
}
