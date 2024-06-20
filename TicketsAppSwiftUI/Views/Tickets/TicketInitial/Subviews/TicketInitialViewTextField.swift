//
//  TicketInitialViewTextField.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct TicketInitialViewTextField: View {
    @EnvironmentObject private var ticketsCoordinator: TicketCoordinator
    @EnvironmentObject private var ticketInitialViewModel: TiketInitialViewModel
    
    enum FocusableField: Hashable {
        case from, to
    }
    
    @FocusState private var focusedField: FocusableField?
    
    var body: some View {
        TextFieldsWrapper {
            HStack {
                Image(AppImageConstants.search)
                .foregroundStyle(AppColorConstants.gray7)
                
                Spacer().frame(width: 16)
                
                VStack {
                    TextField(
                        "",
                        text: $ticketInitialViewModel.enteredFromValue,
                        prompt: Text("Откуда - Минск")
                            .foregroundStyle(AppColorConstants.gray6)
                        )
                        .font(AppFontConstants.buttonText1)
                        .foregroundColor(AppColorConstants.white)
                        .submitLabel(.next)
                        .focused($focusedField, equals: .from)
                        .onSubmit {
                            focusedField = .to
                        }
                    
                    Divider()
                        .background(AppColorConstants.gray7)
                    
                    TextField(
                        "",
                        text: $ticketInitialViewModel.enteredToValue,
                        prompt: Text("Куда - Турция")
                            .foregroundStyle(AppColorConstants.gray6)
                        )
                        .font(AppFontConstants.buttonText1)
                        .foregroundColor(AppColorConstants.white)
                        .focused($focusedField, equals: .to)
                    
                }
            }
        }
        .onChange(of: focusedField) { oldField, newField in
            if newField == .to {
                focusedField = nil
                
                ticketInitialViewModel.handleEnteredValue()
            }
        }
    }
}

#Preview {
    TicketInitialViewTextField()
        .environmentObject(TiketInitialViewModel())
        .environmentObject(TicketCoordinator())
}

