//
//  Eagle_MeetApp.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/22/26.
//

import SwiftUI
import SwiftData

@main
struct Eagle_MeetApp: App {
    var body: some Scene {
        WindowGroup {
            NavBar()
        }
        .modelContainer(for: [User.self, Event.self])
    }
}
