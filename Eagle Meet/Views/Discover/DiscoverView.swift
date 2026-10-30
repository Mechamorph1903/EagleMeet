//
//  DiscoverView.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/28/26.
//

import SwiftUI
import SwiftData

struct DiscoverView: View {
    @State private var searchString: String = ""
    @State private var selectedCategory: String = "All"
    
    // Fetches live events from the database, sorted by upcoming date
    @Query(sort: \Event.date, order: .forward) private var allEvents: [Event]
    
    let categories: [String] = [
        "All", "Sports & Fitness", "Party", "Movie",
        "Music", "Gaming", "Art", "Religious", "Food"
    ]
    
    // Derived array matching category and search filter
    var filteredEvents: [Event] {
        allEvents.filter { event in
            let matchesCategory = (selectedCategory == "All" || event.category == selectedCategory)
            let matchesSearch = searchString.isEmpty || event.title.localizedCaseInsensitiveContains(searchString) || event.location.localizedCaseInsensitiveContains(searchString)
            return matchesCategory && matchesSearch
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                // Header Row (Logo + Profile Link)
                HStack {
                    HStack(spacing: 8) {
                        Image(systemName: "bird.circle.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(.yellow)
                        Text("Eagle Meet")
                            .font(.title2.bold())
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Text("UN")
                            .font(.subheadline.bold())
                            .foregroundStyle(.black)
                            .frame(width: 38, height: 38)
                            .background(.yellow, in: Circle())
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal)
                
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                    TextField("Find your next hangout", text: $searchString)
                }
                .padding(12)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                
                // Category Pills (Horizontal Scroll)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(categories, id: \.self) { category in
                            FilterTabButton(
                                title: category,
                                isSelected: selectedCategory == category
                            ) {
                                selectedCategory = category
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Events Feed Section
                VStack(alignment: .leading, spacing: 14) {
                    Text("Upcoming Events (\(filteredEvents.count))")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView(){
                        if filteredEvents.isEmpty {
                            Text("No events found in this category.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .padding(.horizontal)
                                .padding(.top, 20)
                        } else {
                            // Equivalent to events.map(event => <EventCard ... />)
                            ForEach(filteredEvents) { event in
                                NavigationLink {
                                    EventDetailView(event: event)
                                } label: {
                                    EventCard(event: event)
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .background(Color(red: 0.99, green: 0.97, blue: 0.88).ignoresSafeArea())
    }
}

#Preview {
    NavigationStack {
        DiscoverView()
    }
    .modelContainer(SampleData.previewContainer)
}
