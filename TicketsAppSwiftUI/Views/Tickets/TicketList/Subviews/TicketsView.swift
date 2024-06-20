//
//  TicketsView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 20.06.2024.
//

import SwiftUI

struct TicketsView: View { 
    @EnvironmentObject private var viewModel: TicketListViewModel
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .success(let array):
                LazyVStack(spacing: 16) {
                    ForEach(array) {
                        TicketItemView(ticket: $0)
                            .frame(maxWidth: .infinity)
                    }
                }
                
            case .loading :
                Spacer().frame(width: 0, height: 0)
            }
            
        }
    }
}

#Preview {
    TicketsView()
        .environmentObject(TicketListViewModel(initialData: TicketListInitialData(enteredFromValue: "Minsk", enteredToValue: "Moscow", passagierValue: "1 пассажир", departureDate: Date())))
}
