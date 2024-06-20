//
//  OfferItem.swift
//  TicketsSwiftUI
//
//  Created by Aleksey Shepelev on 18.06.2024.
//

import Foundation

struct OfferItem {
    let id: Int
    let title: String
    let town: String
    let price: String
    let imagePath: String
}

extension OfferItem: Identifiable {
    init(from backendItem: BackendOfferItem) {
        self.id     = backendItem.id
        self.title  = backendItem.title
        self.town   = backendItem.town
        
        self.price = NumberFormatter.spaced.string(from: NSNumber(value: backendItem.price.value)) ?? String(backendItem.price.value)
        
        switch backendItem.id {
        case 1:
            self.imagePath = AppImageConstants.offerId1
        case 2:
            self.imagePath = AppImageConstants.offerId2
        case 3:
            self.imagePath = AppImageConstants.offerId3
        default:
            self.imagePath = AppImageConstants.offerId1
        }
    }
}
