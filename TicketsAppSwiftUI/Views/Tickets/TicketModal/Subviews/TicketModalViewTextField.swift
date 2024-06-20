//
//  TicketModalViewTextField.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct ModalSearchTicketsField: View {
    @EnvironmentObject private var viewModel: TicketModalViewModel
    
    var body: some View {
        TextFieldsWrapper {
            VStack {
                HStack {
                    Image(AppImageConstants.airplane)
                    .foregroundStyle(AppColorConstants.gray7)
                    
                    Spacer().frame(width: 16)
                    
                    Text(viewModel.enteredFromValue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(AppFontConstants.buttonText1)
                        .foregroundStyle(AppColorConstants.white)
                }
                
                Divider()
                    .background(AppColorConstants.gray7)
                
                HStack {
                    Image(AppImageConstants.search)
                    .foregroundStyle(AppColorConstants.gray7)
                    
                    Spacer().frame(width: 16)
                    
                    TextField(
                        "",
                        text: $viewModel.enteredToValue,
                        prompt: Text("Куда - Турция")
                            .foregroundStyle(AppColorConstants.gray6)
                    )
                    .font(AppFontConstants.buttonText1)
                    .foregroundColor(AppColorConstants.white)
                    .onSubmit {
                        viewModel.handleEnteredValue()
                    }
                    
                    Button(
                        action: {
                            viewModel.enteredToValue = ""
                        }, label: {
                            Image(AppImageConstants.close)
                                .foregroundStyle(AppColorConstants.white)
                    })
                }
                
            }
        }
    }
}

#Preview {
    ModalSearchTicketsField()
        .environmentObject(TicketModalViewModel(enteredFromValue: "Минск"))
}
