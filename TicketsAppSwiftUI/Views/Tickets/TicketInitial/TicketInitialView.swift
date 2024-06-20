//
//  TicketInitialView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct TicketInitialView: View {
    @EnvironmentObject private var ticketCoordinator: TicketCoordinator
    
    @StateObject private var tiketInitialViewModel = TiketInitialViewModel()
    
    var body: some View {
        ZStack {
            AppColorConstants.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                TitleTextView(title: "Поиск дешевых\nавиабилетов", textAlignment: .center, multilineTextAlignment: .center)
                
                Spacer().frame(height: 38)
                
                TicketInitialViewTextField()
                    .environmentObject(tiketInitialViewModel)
                
                Spacer().frame(height: 38)
                
                TitleTextView(title: "Музыкально отлететь", textAlignment: .leading, multilineTextAlignment: .leading)
                
                Spacer().frame(height: 26)
                
                OffersView()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.vertical, 26)
            .padding(.horizontal, 16)
        }
        .sheet(isPresented: $ticketCoordinator.showModal, content: {
            TicketModalView(ticketModalViewModel: TicketModalViewModel(enteredFromValue: tiketInitialViewModel.enteredFromValue))
        })
        .onAppear {
            tiketInitialViewModel.coordinator = ticketCoordinator
        }
    }
}

#Preview {
    TicketInitialView()
        .environmentObject(TicketCoordinator())
}
