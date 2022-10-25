//
//  FastingTimerView.swift
//  Intake
//
//  Created by Jonathan Gentry on 9/30/22.
//

import SwiftUI

struct FastingTimerView: View {
    
    @EnvironmentObject var fastingTimer: FastingTimerManager
    
    @FetchRequest(fetchRequest: Item.fetchLastItem) private var lastItem: FetchedResults<Item>
    
    var body: some View {
        VStack(spacing: 18) {
            Spacer()
            VStack {
                Text("Fasting Since")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(lastItem[0].timestamp ?? Date(), formatter: Date.itemFormatter)
                Spacer()
                    .frame(height: 20)
                Text("\(fastingTimer.hoursElapsed) hours")
                    .font(.largeTitle)
                Text("\(fastingTimer.minutesElapsed) minutes")
                    .foregroundColor(.secondary)
                Spacer()
                    .frame(height: 50)
                }
                .frame(width: 300, height: 200)
                .background(.ultraThinMaterial)
                .cornerRadius(30)
                .onAppear(perform: calculateTimeSince)
        }
    }
    
    private func calculateTimeSince() {
        let startDate = lastItem[0].timestamp ?? Date()
        
        let diffComponents = Calendar.current.dateComponents([.minute], from: startDate, to: Date())
        let minutesSinceStart = diffComponents.minute
        print(minutesSinceStart)
        
        fastingTimer.minutesElapsed = minutesSinceStart ?? 0
    }
    
}


