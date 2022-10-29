//
//  FastingTimerManager.swift
//  Intake
//
//  Created by Jonathan Gentry on 10/3/22.
//

import Foundation

final class FastingTimerManager: ObservableObject {
    
    var totalSecondsElapsed: Int = 0 {
        didSet {
            if totalSecondsElapsed >= 3600 {
                hoursElapsed = totalSecondsElapsed / 3600
                minutesElapsed = (totalSecondsElapsed % 3600) / 60
                secondsElapsed = (totalSecondsElapsed % 3600) % 60
            } else if totalSecondsElapsed >= 60 {
                minutesElapsed = totalSecondsElapsed / 60
                secondsElapsed = totalSecondsElapsed % 60
            } else {
                secondsElapsed = totalSecondsElapsed
            }
        }
    }
    
    @Published var minutesElapsed: Int = 0
    @Published var hoursElapsed: Int = 0
    @Published var daysElapsed: Int = 0
    @Published var secondsElapsed: Int = 0
    
    var timer = Timer()
    
    func startFast() {
        timer.invalidate()
        totalSecondsElapsed = 0
        minutesElapsed = 0
        hoursElapsed = 0
        daysElapsed = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.totalSecondsElapsed += 1
        }
    }
    
    func resumeFast() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.totalSecondsElapsed += 1
        }
    }
    
}
