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
}
