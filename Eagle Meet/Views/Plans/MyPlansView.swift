//
//  MyPlansView.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/28/26.
//

import Foundation
import SwiftUI

struct MyPlansView: View {
    @State private var selectedFilter = 0 // 0 = Attending, 1 = Hosting

    var body: some View {
        VStack {
            Picker("Filter", selection: $selectedFilter) {
                Text("Attending").tag(0)
                Text("Hosting").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()

            Spacer()

            Text(selectedFilter == 0 ? "No upcoming plans yet." : "You haven't hosted any events.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Spacer()
        }
        .navigationTitle("My Plans")
    }
}

#Preview {
    NavigationStack {
        MyPlansView()
    }
}
