//
//  RecomendationsViewModel.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import Foundation

class RecommendationsViewModel: ObservableObject {
    @Published var state: RecomendationsState = .loading
    
    init() {
        fetchRecomendations()
    }
    
    private func fetchRecomendations() {
        ApiService.shared.fetchRecomendations { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let backItemList):
                DispatchQueue.main.async {
                    self.state = .success(backItemList.map({ RecommendationItem(from: $0)}))
                }
            case .failure(_):
                DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
                    self.fetchRecomendations()
                }
            }
        }
    }
    
    enum RecomendationsState {
        case success([RecommendationItem])
        case loading
    }
}
