//
//  IntakeApp.swift
//  Intake
//
//  Created by Jonathan Gentry on 8/23/22.
//

import SwiftUI

@main
struct IntakeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
