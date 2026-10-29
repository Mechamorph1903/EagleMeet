//
//  FilterTabButton.swift
//  Eagle Meet
//
//  Created by Daniel Anorue on 10/28/26.
//
import SwiftUI
import Foundation

struct FilterTabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                // Swap colors based on active state
                .background(isSelected ? Color.yellow : Color(.lightGray))
                .foregroundColor(isSelected ? .black : .primary)
                .cornerRadius(20)
        }
        // Smooth animation when transitioning between tabs
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}
