//
//  TicketListView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 20.06.2024.
//

import SwiftUI

struct TicketListView: View {
    @EnvironmentObject private var ticketCoordinator: TicketCoordinator
    
    @ObservedObject var viewModel: TicketListViewModel
    
    var body: some View {
        ZStack {
            
            AppColorConstants.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 4)
                
                TicketListAppBar()
                    .environmentObject(viewModel)
                
                ScrollView(showsIndicators: false) {
                    Spacer().frame(height: 26)
                    
                    TicketsView()
                        .environmentObject(viewModel)
                    
                    Spacer().frame(height: 34)
                }
            }
            .padding(.horizontal, 16)
            
            VStack {
                Spacer()
                
                FilterButtons()
                
                Spacer().frame(height: 16)
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.coordinator = ticketCoordinator
        }
    }
}

#Preview {
    TicketListView(viewModel: TicketListViewModel(initialData: TicketListInitialData(enteredFromValue: "Minsk", enteredToValue: "Moscow", passagierValue: "1 пассажир", departureDate: Date())))
        .environmentObject(TicketCoordinator())
}
