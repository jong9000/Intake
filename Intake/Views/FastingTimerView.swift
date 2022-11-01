//
//  FastingTimerView.swift
//  Intake
//
//  Created by Jonathan Gentry on 9/30/22.
//

import SwiftUI

struct FastingTimerView: View {
    @EnvironmentObject var fastingTimer: FastingTimerManager
    @Environment(\.scenePhase) private var scenePhase
    
    @FetchRequest(fetchRequest: Item.fetchLastItem) private var lastItem: FetchedResults<Item>
    
    private var didChange = NotificationCenter.default.publisher(for: .NSManagedObjectContextObjectsDidChange)
    
    var body: some View {
        VStack(spacing: 18) {
            Spacer()
            VStack {
                Text("Fasting Since")
                    .font(.title)
                    .foregroundColor(.secondary)
                if !lastItem.isEmpty {
                    Text(lastItem[0].timestamp ?? Date(), formatter: Date.itemFormatter)
                }
                Spacer()
                    .frame(height: 20)
                Text("\(fastingTimer.hoursElapsed) hours")
                    .font(.largeTitle)
                Text("\(fastingTimer.minutesElapsed) minutes")
                    .foregroundColor(.secondary)
                Text("\(fastingTimer.secondsElapsed)")
                Spacer()
                    .frame(height: 50)
            }
            .frame(width: 300, height: 200)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            .onChange(of: scenePhase) { _ in
                calculateTimeSince()
            }
            .onReceive(self.didChange) { _ in
                calculateTimeSince()
            }
        }
    }
    
     
    private func calculateTimeSince() {
        var startDate: Date
        
        if !lastItem.isEmpty {
            startDate = lastItem[0].timestamp ?? Date()
        } else {
            startDate = Date()
        }
        
        let diffComponents = Calendar.current.dateComponents([.second], from: startDate, to: Date())
        let secondsSinceStart = diffComponents.second
        
        fastingTimer.totalSecondsElapsed = secondsSinceStart ?? 0
        fastingTimer.resumeFast()
    }
    
}


