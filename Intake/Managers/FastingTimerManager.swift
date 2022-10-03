//
//  FastingTimerManager.swift
//  Intake
//
//  Created by Jonathan Gentry on 10/3/22.
//

import Foundation

final class FastingTimerManager: ObservableObject {
    
    var totalMinutesElapsed = 118 {
        didSet {
            if totalMinutesElapsed >= 60 {
                hoursElapsed = totalMinutesElapsed / 60
                minutesElapsed = totalMinutesElapsed % 60
            } else {
                minutesElapsed = totalMinutesElapsed
            }
        }
    }
    
    @Published var minutesElapsed = 0
    @Published var hoursElapsed = 0
    @Published var daysElapsed = 0
    
    var timer = Timer()
    
    func startFast() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { timer in
            self.totalMinutesElapsed += 1
        }
    }
}
