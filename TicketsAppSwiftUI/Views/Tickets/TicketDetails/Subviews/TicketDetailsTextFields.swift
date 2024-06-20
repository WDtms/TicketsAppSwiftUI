//
//  TicketDetailsTextFields.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct TicketDetailsTextFields: View {
    @EnvironmentObject private var ticketDetailsViewModel: TicketDetailsViewModel
    
    var body: some View {
        TextFieldsWrapper {
            HStack {
                Button(
                    action: {
                        ticketDetailsViewModel.goBack()
                    }, label: {
                        Image(AppImageConstants.letfArrowIcon)
                            .foregroundStyle(AppColorConstants.white)
                    })
                
                Spacer().frame(width: 8)
                
                VStack {
                    HStack {
                        Text(ticketDetailsViewModel.enteredFromValue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(AppFontConstants.buttonText1)
                            .foregroundStyle(AppColorConstants.white)
                        
                        Button(
                            action: {
                                ticketDetailsViewModel.swapValues()
                            }, label: {
                                Image(AppImageConstants.swap)
                                    .foregroundStyle(AppColorConstants.white)
                            })
                    }
                    
                    Divider()
                        .background(AppColorConstants.gray7)
                    
                    HStack {
                        TextField(
                            "",
                            text: $ticketDetailsViewModel.enteredToValue,
                            prompt: Text("Куда - Турция")
                                .foregroundStyle(AppColorConstants.gray6)
                        )
                        .font(AppFontConstants.buttonText1)
                        .foregroundColor(AppColorConstants.white)
                        
                        Button(
                            action: {
                                ticketDetailsViewModel.enteredToValue = ""
                            }, label: {
                                Image(AppImageConstants.close)
                                    .foregroundStyle(AppColorConstants.white)
                            })
                    }
                    
                }
            }
        }
    }
}

#Preview {
    TicketDetailsTextFields()
        .environmentObject(TicketDetailsViewModel(enteredFromValue: "Минск", enteredToValue: "Сочи"))
}
