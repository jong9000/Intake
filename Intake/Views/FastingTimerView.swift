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
                Text("\(fastingTimer.hoursElapsed)")
                    .font(.largeTitle)
                Text("\(fastingTimer.minutesElapsed)")
                    .foregroundColor(.secondary)
                Spacer()
                    .frame(height: 50)
                }
                .frame(width: 300, height: 200)
                .background(.ultraThinMaterial)
                .cornerRadius(30)
        }
    }
}
