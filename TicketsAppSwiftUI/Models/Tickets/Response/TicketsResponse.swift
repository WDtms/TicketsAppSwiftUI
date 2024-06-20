//
//  TicketsResponse.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 20.06.2024.
//

import Foundation

struct TicketsResponse: Decodable {
    let tickets: [BackendTicketItem]
}


struct BackendTicketItem: Decodable {
    let id: Int
    let badge: String?
    let price: BackendPrice
    let providerName: String
    let company: String
    let departure: AirportData
    let arrival: AirportData
    let hasTransfer: Bool
    let hasVisaTransfer: Bool
    let luggage: Luggage
    let handLuggage: HandLuggage
    let isReturnable: Bool
    let isExchangable: Bool
    
    enum CodingKeys: String, CodingKey {
        case id                 = "id"
        case badge              = "badge"
        case price              = "price"
        case providerName       = "provider_name"
        case company            = "company"
        case departure          = "departure"
        case arrival            = "arrival"
        case hasTransfer        = "has_transfer"
        case hasVisaTransfer    = "has_visa_transfer"
        case luggage            = "luggage"
        case handLuggage        = "hand_luggage"
        case isReturnable       = "is_returnable"
        case isExchangable      = "is_exchangable"
    }
    
    struct AirportData: Decodable {
        let town: String
        let date: String
        let airport: String
    }
    
    struct Luggage: Decodable {
        let hasLuggage: Bool
        let price: BackendPrice?
        
        enum CodingKeys: String, CodingKey {
            case hasLuggage = "has_luggage"
            case price      = "price"
        }
    }

    struct HandLuggage: Decodable {
        let hasHandLuggage: Bool
        
        enum CodingKeys: String, CodingKey {
            case hasHandLuggage = "has_hand_luggage"
        }
    }
}
