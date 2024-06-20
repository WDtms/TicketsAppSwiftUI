//
//  TicketDetailsViewModel.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import Foundation

class TicketDetailsViewModel: ObservableObject {
    weak var coordinator: TicketCoordinator?
    
    @Published var enteredFromValue: String     = ""
    @Published var enteredToValue: String       = ""
    @Published var forwardDate: Date            = Date()
    @Published var returnDate: Date?
    
    var formattedForwardDateTitle: String {
        DateUtils.convertTodMMMFormat(date: forwardDate)
    }
    
    var formattedForwardDateSubtitle: String {
        DateUtils.convertToEEEFormat(date: forwardDate)
    }
    
    var formattedReturnDateTitle: String? {
        guard let returnDate = returnDate else { return nil }
        
        return DateUtils.convertTodMMMFormat(date: returnDate)
    }
    
    var formattedReturnDateSubtitle: String? {
        guard let returnDate = returnDate else { return nil }
        
        return DateUtils.convertToEEEFormat(date: returnDate)
    }
    
    init(enteredFromValue: String, enteredToValue: String) {
        self.enteredFromValue = enteredFromValue
        self.enteredToValue = enteredToValue
    }
    
    func swapValues() {
        let tempFrom = enteredFromValue
        enteredFromValue = enteredToValue
        enteredToValue = tempFrom
    }
    
    func goBack() {
        coordinator?.pop()
    }
    
    func seeAllTickets() {
        coordinator?.navigateToTicketsList(with: TicketListInitialData(
            enteredFromValue: enteredFromValue,
            enteredToValue: enteredToValue, 
            passagierValue: "1 пассажир",
            departureDate: forwardDate)
        )
    }
}
