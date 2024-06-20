//
//  TicketDetailsView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct TicketDetailsView: View {
    @EnvironmentObject private var ticketCoordinator: TicketCoordinator
    
    @ObservedObject var ticketDetailsViewModel: TicketDetailsViewModel
    
    var body: some View {
        ZStack {
            AppColorConstants.black.edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    TicketDetailsTextFields()
                        .environmentObject(ticketDetailsViewModel)
                        .padding(.horizontal, 16)
                    
                    Spacer().frame(height: 15)
                    
                    AdditionalDetailsRow()
                        .environmentObject(ticketDetailsViewModel)
                    
                    Spacer().frame(height: 15)
                    
                    RecommendationsView()
                        .padding(.horizontal, 16)
                    
                    Spacer().frame(height: 18)
                    
                    Button(action: {
                        ticketDetailsViewModel.seeAllTickets()
                    }, label: {
                        Text("Посмотреть все билеты")
                            .foregroundStyle(AppColorConstants.white)
                            .frame(maxWidth: .infinity)
                            .italic()
                    })
                    .frame(height: 42)
                    .background(AppColorConstants.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 16)
                    
                    Spacer().frame(height: 34)
                    
                    ToggleButtonView()
                        .padding(.horizontal, 16)
                }
                .padding(.vertical, 47)
            }
        }
        .onAppear {
            ticketDetailsViewModel.coordinator = ticketCoordinator
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TicketDetailsView(ticketDetailsViewModel: TicketDetailsViewModel(enteredFromValue: "Минск", enteredToValue: "Вальхала"))
        .environmentObject(TicketCoordinator())
}
