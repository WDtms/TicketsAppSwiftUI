//
//  OffersViewModel.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import Foundation

class OffersViewModel: ObservableObject {
    @Published var state: OffersViewModelState = .loading
    
    init() {
        loadItems()
    }
    
    private func loadItems() {
        ApiService.shared.fetchOffers { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let backItemList):
                DispatchQueue.main.async {
                    self.state = .success(backItemList.map({ OfferItem(from: $0)}))
                }
            case .failure(_):
                DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
                    self.loadItems()
                }
            }
        }
    }
    
    enum OffersViewModelState {
        case success([OfferItem])
        case loading
    }
}
