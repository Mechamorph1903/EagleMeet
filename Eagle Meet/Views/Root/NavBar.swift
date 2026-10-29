//
//  NavBar.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/27/26.
//

import Foundation
import SwiftUI

struct NavBar: View {
    @State private var selectedTab = 0
    var body: some View {
            TabView(selection: $selectedTab) {
                // Tab 1: Discover (Home)
                NavigationStack {
                    DiscoverView()
                }
                .tabItem {
                    Label("Discover", systemImage: "safari")
                }
                .tag(0)

                // Tab 2: Create
                NavigationStack {
                    AddEventView()
                }
                .tabItem {
                    Label("Create", systemImage: "plus.circle")
                }
                .tag(1)

                // Tab 3: My Plans
                NavigationStack {
                    MyPlansView()
                }
                .tabItem {
                    Label("My Plans", systemImage: "calendar")
                }
                .tag(2)
            }
        }
}

#Preview {
    NavBar()
}
