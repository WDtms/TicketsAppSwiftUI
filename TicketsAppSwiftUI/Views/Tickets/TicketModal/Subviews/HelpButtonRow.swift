//
//  HelpButtonRow.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct HelpButtonRow: View {
    @EnvironmentObject private var ticketCoordinator: TicketCoordinator
    @EnvironmentObject private var ticketModalViewModel: TicketModalViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            HelpButton(
                color: AppColorConstants.green,
                imagePath: AppImageConstants.difficultRoute,
                title: "Сложный маршрут"
            ) {
                ticketCoordinator.showModal = false
            }
            
            Spacer()
            
            HelpButton(
                color: AppColorConstants.blue,
                imagePath: AppImageConstants.web,
                title: "Куда угодно"
            ){
                ticketModalViewModel.enterProposedOption(with: "Куда угодно")
            }
            
            Spacer()
            
            HelpButton(
                color: AppColorConstants.darkBlue,
                imagePath: AppImageConstants.calendar,
                title: "Выходные"
            ){
                ticketCoordinator.showModal = false
            }
            
            Spacer()
            
            HelpButton(
                color: AppColorConstants.red,
                imagePath: AppImageConstants.fire,
                title: "Горячие билеты"
            ){
                ticketCoordinator.showModal = false
            }
        }
    }
}

fileprivate struct HelpButton: View {
    let color: Color
    let imagePath: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            VStack {
                
                ZStack {
                    Image(imagePath)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    
                }
                .frame(width: 48, height: 48)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Spacer()
                    .frame(height: 8)
                
                Text(title)
                    .font(AppFontConstants.text2)
                    .foregroundStyle(AppColorConstants.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                
            }.frame(width: 70)
        })
    }
}

#Preview {
    ZStack {
        AppColorConstants.gray2
        
        HelpButtonRow()
            .environmentObject(TicketCoordinator())
            .environmentObject(TicketModalViewModel(enteredFromValue: "Минск"))
    }
}
