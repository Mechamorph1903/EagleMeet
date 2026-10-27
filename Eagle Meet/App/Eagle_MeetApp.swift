//
//  Eagle_MeetApp.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/22/26.
//

import SwiftUI
import CoreData

@main
struct Eagle_MeetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
