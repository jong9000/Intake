//
//  Date+Formatter.swift
//  Intake
//
//  Created by Jonathan Gentry on 9/30/22.
//

import Foundation

extension Date {
    static var itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
}
