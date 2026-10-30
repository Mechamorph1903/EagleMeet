//
//  Event.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/27/26.
//

import Foundation
import SwiftData

@Model
final class Event {
    var id: UUID
    var title: String
    var category: String
    var date: Date //both date and time will be stored
    var location: String
    var details: String
    @Attribute(.externalStorage) var imageData: Data?
    var organizer: User
    var attendees: [User]
    var participantsLimit: Int
    var isCancelled: Bool
    
    
    init(title: String, category: String, date: Date, location: String, organizer: User, details: String, participantsLimit: Int, imageData: Data? = nil){
        self.id = UUID()
        self.title = title
        self.category = category
        self.date = date
        self.location = location
        self.organizer = organizer
        self.details = details
        self.imageData = imageData
        self.attendees = []
        self.participantsLimit = participantsLimit
        self.isCancelled = false
        
    }
    
    
}
