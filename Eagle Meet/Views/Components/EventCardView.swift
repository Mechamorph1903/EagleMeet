//
//  EventCardView.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/27/26.
//

import SwiftUI
import Foundation

struct EventCard: View {
    let event: Event
    var body: some View {
        HStack{
            // MARK: - Image Container
            // If the user uploaded an image, decode from Data; otherwise show a fallback icon
            Group {
                if let data = event.imageData, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                } else {
                    // Placeholder when no photo is attached
                    ZStack {
                        Color.yellow.opacity(0.2)
                        Image(systemName: "photo")
                            .font(.title3)
                            .foregroundStyle(.yellow)
                    }
                }
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // MARK: - Event Info Stack
            VStack(alignment : .leading, spacing: 6){
                HStack {
                                    Text(event.category.uppercased())
                                        .font(.caption2.bold())
                                        .foregroundStyle(.secondary)
                                    
                                    Spacer()
                                    
                                    Text(event.date.formatted(date: .abbreviated, time: .shortened))
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }

                                // Title
                                Text(event.title)
                                    .font(.headline)
                                    .lineLimit(1)
                                
                                // Location
                                HStack(spacing: 4) {
                                    Image(systemName: "mappin.and.ellipse")
                                        .font(.caption2)
                                    Text(event.location)
                                        .font(.caption)
                                }
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                            }
                            
                            Spacer(minLength: 0)
                        }
                        .padding(12)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    // 1. Create a mock user
    let sampleUser = User(name: "Daniel Anorue", email: "dan@example.com")
    
    // 2. Create a mock event
    let sampleEvent = Event(
        title: "Campus Pickup Basketball",
        category: "Sports & Fitness",
        date: .now.addingTimeInterval(3600 * 2), // 2 hours from now
        location: "Payne Center Courts",
        organizer: sampleUser,
        details: "5v5 full-court pickup game. All skill levels welcome.",
        participantsLimit: 15,
        imageData: nil // Passing nil will display the placeholder image
    )

    // 3. Render the preview wrapped in padding and pale yellow background
    ZStack {
        Color(red: 0.99, green: 0.97, blue: 0.88).ignoresSafeArea()
        
        EventCard(event: sampleEvent)
            .padding(.horizontal)
    }
}
