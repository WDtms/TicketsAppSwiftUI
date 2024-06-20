//
//  RecommendationItem.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import Foundation

struct RecommendationItem: Identifiable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: String
}

extension RecommendationItem {
    init(from backendItem: BackendRecommendationItem) {
        self.id         = backendItem.id
        self.title      = backendItem.title
        self.timeRange  = backendItem.timeRange
        
        self.price = NumberFormatter.spaced.string(from: NSNumber(value: backendItem.price.value)) ?? String(backendItem.price.value)
    }
}
