//
//  TicketListViewModel.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 20.06.2024.
//

import Foundation

class TicketListViewModel: ObservableObject {
    weak var coordinator: TicketCoordinator?
    
    @Published var state: TicketListState = .loading
    
    @Published var enteredFromValue: String
    @Published var enteredToValue: String
    @Published var departureDate: String
    @Published var passagierData: String
    
    init(initialData: TicketListInitialData) {
        self.enteredFromValue   = initialData.enteredFromValue
        self.enteredToValue     = initialData.enteredToValue
        self.departureDate      = DateUtils.convertTodMMMMFormat(date: initialData.departureDate)
        self.passagierData      = initialData.passagierValue
        
        loadItems()
    }
    
    enum TicketListState {
        case success([TicketItem])
        case loading
    }
    
    private func loadItems() {
        ApiService.shared.fetchTickets { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let backItemList):
                DispatchQueue.main.async {
                    self.state = .success(backItemList.map({ TicketItem(from: $0)}))
                }
            case .failure(_):
                DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
                    self.loadItems()
                }
            }
        }
    }
    
    func goBack() {
        coordinator?.pop()
    }
}
