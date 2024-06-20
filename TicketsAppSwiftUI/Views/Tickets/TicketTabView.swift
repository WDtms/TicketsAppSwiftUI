//
//  TicketTabView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct TicketTabView: View {
    @EnvironmentObject private var ticketCoordinator: TicketCoordinator
    
    var body: some View {
        NavigationStack(path: $ticketCoordinator.navigationPath) {
            TicketInitialView()
                .navigationDestination(for: TicketDetailsInitialData.self) { initialData in
                    TicketDetailsView(
                        ticketDetailsViewModel: TicketDetailsViewModel(
                            enteredFromValue: initialData.enteredFromValue,
                            enteredToValue: initialData.enteredToValue
                        )
                    )
                }
                .navigationDestination(for: TicketListInitialData.self) { initialData in
                    TicketListView(
                        viewModel: TicketListViewModel(
                            initialData: initialData
                        )
                    )
                }
        }
    }
}

#Preview {
    TicketTabView()
        .environmentObject(TicketCoordinator())
}
