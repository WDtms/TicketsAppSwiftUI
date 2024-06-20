//
//  TiketInitialViewModel.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import Foundation

class TiketInitialViewModel: ObservableObject {
    private let enteredFromValueKey = "enteredFromValueKey"
    
    weak var coordinator: TicketCoordinator?
    
    init() {
        loadPreviousFromValue()
    }
    
    private func loadPreviousFromValue() {
        enteredFromValue = UserDefaults.standard.string(forKey: enteredFromValueKey) ?? ""
    }
    
    @Published var enteredFromValue: String = ""
    @Published var enteredToValue: String   = ""
    
    func handleEnteredValue() {
        guard !enteredFromValue.isEmpty else { return }
        
        UserDefaults.standard.setValue(enteredFromValue, forKey: enteredFromValueKey)
        
        coordinator?.showModalView()
    }
}
