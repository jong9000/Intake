//
//  IntakePredicate.swift
//  Intake
//
//  Created by Jonathan Gentry on 9/29/22.
//

import Foundation

struct IntakePredicate {
    static let fromToday = NSPredicate(format: "timestamp >= %@", UserCalendar().startOfDay as NSDate)
    static let tilToday = NSPredicate(format: "timestamp < %@", UserCalendar().startOfDay as NSDate)
    static let fromYesterday = NSPredicate(format: "timestamp > %@", UserCalendar().startOfYesterday as NSDate)
    static let tilYesterday = NSPredicate(format: "timestamp < %@", UserCalendar().startOfYesterday as NSDate)
    static let fromDayBeforeYesterday = NSPredicate(format: "timestamp > %@", UserCalendar().startOfDayBeforeYesterday as NSDate)
    static let tilDayBeforeYesterday = NSPredicate(format: "timestamp < %@", UserCalendar().startOfDayBeforeYesterday as NSDate)
    static let fromDayBeforeDayBeforeYesterday = NSPredicate(format: "timestamp > %@", UserCalendar().startOfDayBeforeDayBeforeYesterday as NSDate)
}
