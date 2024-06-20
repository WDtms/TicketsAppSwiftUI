//
//  AppBar.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 20.06.2024.
//

import SwiftUI

struct TicketListAppBar: View {
    @EnvironmentObject private var ticketListViewModel: TicketListViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            
            Button(action: {
                ticketListViewModel.goBack()
                
            }, label: {
                Image(AppImageConstants.letfArrowIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(AppColorConstants.blue)
            })
            
            Spacer().frame(width: 4)
            
            VStack(alignment: .leading) {
                
                Text("\(ticketListViewModel.enteredFromValue)-\(ticketListViewModel.enteredToValue)")
                    .font(AppFontConstants.title3)
                    .foregroundStyle(AppColorConstants.white)
                
                Spacer().frame(height: 4)
                
                Text("\(ticketListViewModel.departureDate), \(ticketListViewModel.passagierData)")
                    .font(AppFontConstants.title4)
                    .foregroundStyle(AppColorConstants.gray6)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .background(AppColorConstants.gray2)
    }
}

#Preview {
    TicketListAppBar()
        .environmentObject(TicketListViewModel(initialData: TicketListInitialData(enteredFromValue: "Minsk", enteredToValue: "Moscow", passagierValue: "1 пассажир", departureDate: Date())))
}
