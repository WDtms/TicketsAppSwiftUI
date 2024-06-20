//
//  RecomendationsResponse.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import Foundation

struct RecommendationsResponse: Decodable {
    let ticketOffers: [BackendRecommendationItem]

    enum CodingKeys: String, CodingKey {
        case ticketOffers = "tickets_offers"
    }
}

struct BackendRecommendationItem: Decodable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: BackendPrice
    
    enum CodingKeys: String, CodingKey {
        case id         = "id"
        case title      = "title"
        case timeRange  = "time_range"
        case price      = "price"
    }
}
