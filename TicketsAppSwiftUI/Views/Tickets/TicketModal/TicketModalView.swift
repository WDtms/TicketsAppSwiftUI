//
//  TicketModal.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct TicketModalView: View {
    @EnvironmentObject private var ticketCoordinator: TicketCoordinator
    
    @StateObject var ticketModalViewModel: TicketModalViewModel
    
    var body: some View {
        ZStack {
            AppColorConstants.gray2.edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    Spacer().frame(height: 16)
                    
                    ZStack {}
                        .frame(width: 38, height: 5)
                        .background(AppColorConstants.gray5)
                    
                    Spacer().frame(height: 25)
                    
                    ModalSearchTicketsField()
                        .environmentObject(ticketModalViewModel)
                    
                    Spacer().frame(height: 26)
                    
                    HelpButtonRow()
                        .environmentObject(ticketModalViewModel)
                    
                    Spacer().frame(height: 26)
                    
                    GoToOptionsList()
                        .environmentObject(ticketModalViewModel)
                }
                .padding(.horizontal, 16)
            }
        }
        .onAppear {
            ticketModalViewModel.coordinator = ticketCoordinator
        }
    }
}

#Preview {
    TicketModalView(ticketModalViewModel: TicketModalViewModel(enteredFromValue: "bla-bla"))
        .environmentObject(TicketCoordinator())
}
