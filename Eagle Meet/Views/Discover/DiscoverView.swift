//
//  DiscoverView.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/28/26.
//

import SwiftUI

struct DiscoverView: View {
    @State private var searchString: String = ""
    @State private var selectedCategory: String = "All"
    
    let categories: [String] = [
        "All", "Sports & Fitness", "Party", "Movie",
        "Music", "Gaming", "Art", "Religious", "Food"
    ]
    
    var body: some View {
        // Outer ScrollView so the whole screen scrolls vertically once content overflows
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                // MARK: - Top Header (justify-content: space-between)
                HStack {
                    HStack(spacing: 10) {
                        Image(systemName: "bird.circle.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(.yellow)
                        
                        Text("Eagle Meet")
                            .font(.title2.bold())
                    }
                    
                    Spacer() // Pushes logo to far left, avatar to far right
                    
                    // User initials avatar badge
                    Button(action: {
                        // Action: e.g. navigate to Profile or toggle a sheet
                        NavigationStack.push( ProfileView() )
                        print("Profile avatar tapped")
                    }) {
                        // Label: the visual element
                        Text("UN")
                            .font(.subheadline.bold())
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                            .background(.yellow, in: Circle())
                    }
                }
                .padding(.horizontal)
                
                // MARK: - Hero Text
                VStack(alignment: .leading, spacing: 4) {
                    Text("What's the plan today?")
                        .font(.title2.bold())
                    Text("Make your next memory")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                
                // MARK: - Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                    TextField("Find your next hangout", text: $searchString)
                }
                .padding(12)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                
                // MARK: - Categories (overflow-x: scroll)
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
                
                // MARK: - Events Feed Section Placeholder
                VStack(alignment: .leading, spacing: 12) {
                    Text("Upcoming Events")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    // Event cards will be mapped here
                }
                
            }
            .padding(.vertical)
        }
        .background(Color.yellow.opacity(0.12).ignoresSafeArea())
    }
}


#Preview {
    NavigationStack {
        DiscoverView()
    }
}
