//
//  TicketItem.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 20.06.2024.
//

import Foundation

struct TicketItem: Identifiable {
    let id: Int
    let badge: String?
    let flightLength: String
    let price: String
    let departure: AirportData
    let arrival: AirportData
    let hasTransfer: Bool
    
    struct AirportData {
        let date: String
        let airport: String
    }
}

extension TicketItem {
    init(from backendItem: BackendTicketItem) {
        self.id             = backendItem.id
        self.badge          = backendItem.badge
        self.hasTransfer    = backendItem.hasTransfer
        
        self.price  = NumberFormatter.spaced.string(from: NSNumber(value: backendItem.price.value)) ?? String(backendItem.price.value)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        
        
        let departureBackendModel   = backendItem.departure
        let departureDate           = dateFormatter.date(from: departureBackendModel.date) ?? Date()
        
        
        let arrivalBackendModel     = backendItem.arrival
        let arrivalDate             = dateFormatter.date(from: arrivalBackendModel.date) ?? Date()
        
        self.departure  = AirportData(date: DateUtils.convertToHHMMFormat(date: departureDate), airport: departureBackendModel.airport)
        self.arrival    = AirportData(date: DateUtils.convertToHHMMFormat(date: arrivalDate), airport: arrivalBackendModel.airport)
        
        self.flightLength = TicketItem.calculateFlightLength(from: departureDate, to: arrivalDate)
    }
    
    private static func calculateFlightLength(from departure: Date, to arrival: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: departure, to: arrival)

        guard let days = components.day, let hours = components.hour, let minutes = components.minute else {
            return ""
        }

        var result = ""
        
        if days > 0 {
            result += "\(days)д, "
        }
        
        let totalHours = Double(hours) + Double(minutes) / 60.0
        result += String(format: "%.1fч", totalHours)
        
        return result
    }
}
