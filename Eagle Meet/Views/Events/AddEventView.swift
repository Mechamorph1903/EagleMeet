//
//  AddEventView.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/27/26.
//

import Foundation
import SwiftUI
import PhotosUI

struct AddEventView: View {
    @State private var title = ""
    @State private var location = ""
    @State private var eventDate = Date()
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImageData: Data?

    var body: some View {
        Form {
            Section("Event Info") {
                TextField("Event Title", text: $title)
                TextField("Location", text: $location)
            }
            
            Section("Date & Time") {
                DatePicker("When", selection: $eventDate, displayedComponents: [.date, .hourAndMinute])
            }
            
            Section("Image"){
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Text("Select Event Photo")
                }
                .onChange(of: selectedItem) { _, newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
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
