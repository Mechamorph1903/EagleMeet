//
//  SampleData.swift
//  Eagle Meet
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    // 10 Mock Users
    static let users: [User] = [
        User(name: "Daniel Anorue", email: "dan@usm.edu"),
        User(name: "Marcus Vance", email: "marcus.v@usm.edu"),
        User(name: "Chloe Bennett", email: "cbennett@usm.edu"),
        User(name: "Jordan Lee", email: "jlee@usm.edu"),
        User(name: "Aaliyah Smith", email: "aaliyah.s@usm.edu"),
        User(name: "Devon Miller", email: "dmiller@usm.edu"),
        User(name: "Samantha Reed", email: "sreed@usm.edu"),
        User(name: "Trey Jenkins", email: "tjenkins@usm.edu"),
        User(name: "Maya Patel", email: "mpatel@usm.edu"),
        User(name: "Carlos Ortiz", email: "cortiz@usm.edu")
    ]
    
    // 10 Mock Events spanning different categories
    static var events: [Event] {
        [
            Event(
                title: "Campus Pickup Basketball 5v5",
                category: "Sports & Fitness",
                date: Calendar.current.date(byAdding: .hour, value: 2, to: .now)!,
                location: "Payne Center Courts",
                organizer: users[0],
                details: "Full court runs, winners stay on. Bring a black and white tee.",
                participantsLimit: 15
            ),
            Event(
                title: "Smash Ultimate & Mario Kart Night",
                category: "Gaming",
                date: Calendar.current.date(byAdding: .hour, value: 5, to: .now)!,
                location: "Thad Cochran Center Rm 218",
                organizer: users[1],
                details: "Friendly tournament setup with pizza and snacks. BYOC if possible.",
                participantsLimit: 24
            ),
            Event(
                title: "Study Jam: Data Structures & Algorithms",
                category: "Academic",
                date: Calendar.current.date(byAdding: .day, value: 1, to: .now)!,
                location: "Cook Library 2nd Floor Study Room",
                organizer: users[2],
                details: "Reviewing trees, graphs, and dynamic programming for upcoming exams.",
                participantsLimit: 8
            ),
            Event(
                title: "Late Night Waffle & Pancake Run",
                category: "Food",
                date: Calendar.current.date(byAdding: .day, value: 1, to: .now)!,
                location: "Fresh Food Company",
                organizer: users[3],
                details: "Taking a break from project deadlines for midnight breakfast.",
                participantsLimit: 12
            ),
            Event(
                title: "Weekend Outdoor Movie: Interstellar",
                category: "Movie",
                date: Calendar.current.date(byAdding: .day, value: 2, to: .now)!,
                location: "Weathersby Lawn",
                organizer: users[4],
                details: "Projector screening on the grass. Bring blankets and lawn chairs.",
                participantsLimit: 50
            ),
            Event(
                title: "Acoustic Jam Session & Open Mic",
                category: "Music",
                date: Calendar.current.date(byAdding: .day, value: 3, to: .now)!,
                location: "Mannoni Performing Arts Lawn",
                organizer: users[5],
                details: "Guitars, singers, and keyboardists welcome. Low pressure session.",
                participantsLimit: 20
            ),
            Event(
                title: "Friday Night Kickback",
                category: "Party",
                date: Calendar.current.date(byAdding: .day, value: 4, to: .now)!,
                location: "Eagle Walk Courtyard",
                organizer: users[6],
                details: "Music, card games, and celebrating the end of midterm week.",
                participantsLimit: 40
            ),
            Event(
                title: "Sunday Evening Fellowship & Discussion",
                category: "Religious",
                date: Calendar.current.date(byAdding: .day, value: 5, to: .now)!,
                location: "Danforth Chapel",
                organizer: users[7],
                details: "Open faith chat, light snacks, and group study.",
                participantsLimit: 25
            ),
            Event(
                title: "Pottery & Canvas Painting Workshop",
                category: "Art",
                date: Calendar.current.date(byAdding: .day, value: 6, to: .now)!,
                location: "George Hurst Building Rm 104",
                organizer: users[8],
                details: "Free supplies provided. Paint custom mugs or mini canvasses.",
                participantsLimit: 16
            ),
            Event(
                title: "Sunset 5K Campus Group Run",
                category: "Sports & Fitness",
                date: Calendar.current.date(byAdding: .day, value: 7, to: .now)!,
                location: "Pride Field Loop",
                organizer: users[9],
                details: "Casual pace (around 9-10 min/mile). Everyone welcome.",
                participantsLimit: 30
            )
        ]
    }
    
    // In-memory container pre-populated with all 10 events for previews & tests
    static var previewContainer: ModelContainer = {
        let schema = Schema([User.self, Event.self])
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: [configuration])
        
        let context = container.mainContext
        for user in users {
            context.insert(user)
        }
        for event in events {
            context.insert(event)
        }
        
        return container
    }()
}
