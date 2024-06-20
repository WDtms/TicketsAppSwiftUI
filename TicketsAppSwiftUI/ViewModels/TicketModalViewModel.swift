//
//  TicketModalViewModel.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import Foundation

class TicketModalViewModel: ObservableObject {
    weak var coordinator: TicketCoordinator?
    
    @Published var enteredToValue: String   = ""
    
    let enteredFromValue: String
    
    init(enteredFromValue: String) {
        self.enteredFromValue = enteredFromValue
    }
    
    func enterProposedOption(with value: String) {
        enteredToValue = value
        
        coordinator?.hideModalView()
        coordinator?.navigateToDetails(with: self.toDetailsInitialData())
    }
    
    func handleEnteredValue() {
        guard !enteredToValue.isEmpty else { return }
        
        coordinator?.hideModalView()
        coordinator?.navigateToDetails(with: self.toDetailsInitialData())
    }
}

extension TicketModalViewModel {
    func toDetailsInitialData() -> TicketDetailsInitialData {
        TicketDetailsInitialData(enteredFromValue: enteredFromValue, enteredToValue: enteredToValue)
    }
}
