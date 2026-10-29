//
//  ContentView.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/22/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavBar()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [User.self, Event.self], inMemory: true)
}
