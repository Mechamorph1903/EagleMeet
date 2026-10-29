//
//  AddEventView.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/27/26.
//

import Foundation
import SwiftUI

struct AddEventView: View {
    @State private var title = ""
    @State private var location = ""
    @State private var eventDate = Date()

    var body: some View {
        Form {
            Section("Event Info") {
                TextField("Event Title", text: $title)
                TextField("Location", text: $location)
            }
            
            Section("Date & Time") {
                DatePicker("When", selection: $eventDate, displayedComponents: [.date, .hourAndMinute])
            }
        }
        .navigationTitle("Create Event")
    }
}

#Preview {
    NavigationStack {
        AddEventView()
    }
}
