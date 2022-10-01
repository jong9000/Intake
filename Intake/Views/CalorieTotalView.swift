//
//  CalorieTotalView.swift
//  Intake
//
//  Created by Jonathan Gentry on 9/16/22.
//

import SwiftUI

struct CalorieTotalView: View {
    
    var title: String
    var amount: String
    
    var body: some View {
        VStack(spacing: 18) {
            Spacer()
            VStack {
                Text(title)
                    .font(.title)
                    .foregroundColor(.secondary)
                Spacer()
                    .frame(height: 20)
                Text(amount)
                    .font(.largeTitle)
                Text("kCal")
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

struct CalorieTotalView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieTotalView(title: "Today", amount: "100")
            .preferredColorScheme(.dark)
    }
}
