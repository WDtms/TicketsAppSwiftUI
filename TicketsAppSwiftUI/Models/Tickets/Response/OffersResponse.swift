//
//  BackendOfferItem.swift
//  TicketsSwiftUI
//
//  Created by Aleksey Shepelev on 18.06.2024.
//

import Foundation

struct OffersResponse: Decodable {
    let offers: [BackendOfferItem]
}

struct BackendOfferItem: Decodable {
    let id: Int
    let title: String
    let town: String
    let price: BackendPrice
}
