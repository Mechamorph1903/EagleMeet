//
//  Untitled.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/27/26.
//

import Foundation
import SwiftData

@Model
final class User {
    var id: UUID
    var name: String
    var email: String
    var bio : String
    var hobbies: [String]
    @Relationship(deleteRule: .cascade, inverse: \Event.organizer)
    var events: [Event] = []

    init(name: String, email: String) {
        self.id = UUID()
        self.name = name
        self.email = email
        self.bio = ""
        self.hobbies = []
    }
}
