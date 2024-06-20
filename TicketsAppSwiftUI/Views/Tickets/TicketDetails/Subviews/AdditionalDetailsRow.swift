//
//  AdditionalDetailsRow.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct AdditionalDetailsRow: View {
    @EnvironmentObject private var ticketDetailsViewModel: TicketDetailsViewModel
    
    @State private var showReturnDatePicker     = false
    @State private var showForwardDatePicker    = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                AdditionalDetailsButton(
                    title: ticketDetailsViewModel.formattedReturnDateTitle == nil ? "обратно" : ticketDetailsViewModel.formattedReturnDateTitle!,
                    subtitle: ticketDetailsViewModel.formattedReturnDateSubtitle == nil ? nil : ticketDetailsViewModel.formattedReturnDateSubtitle!,
                    iconPath: AppImageConstants.plus) {
                        showReturnDatePicker = true
                    }
                    .popover(isPresented: $showReturnDatePicker) {
                        DatePickerView(
                            selectedDate: $ticketDetailsViewModel.returnDate
                        )
                        .presentationCompactAdaptation(.popover)
                        .frame(width: 300, height: 300)
                        .padding()
                    }
                
                AdditionalDetailsButton(
                    title: ticketDetailsViewModel.formattedForwardDateTitle,
                    subtitle: ticketDetailsViewModel.formattedForwardDateSubtitle,
                    iconPath: nil
                ) {
                    showForwardDatePicker = true
                }
                .popover(isPresented: $showForwardDatePicker) {
                    DatePickerView(
                        selectedDate: $ticketDetailsViewModel.forwardDate
                    )
                    .presentationCompactAdaptation(.popover)
                    .frame(width: 300, height: 300)
                    .padding()
                }
                
                AdditionalDetailsButton(
                    title: "1, эконом",
                    subtitle: nil,
                    iconPath: AppImageConstants.passagier
                ) {
                    
                }
                
                AdditionalDetailsButton(
                    title: "фильтры",
                    subtitle: nil,
                    iconPath: AppImageConstants.filters
                ) {
                    
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

fileprivate struct AdditionalDetailsButton: View {
    let title: String
    let subtitle: String?
    let iconPath: String?
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 0) {
                
                if let iconPath {
                    Image(iconPath)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundStyle(AppColorConstants.white)
                    
                    Spacer().frame(width: 8)
                }
                
                Text(title)
                    .font(AppFontConstants.title4)
                    .foregroundStyle(AppColorConstants.white)
                    .italic()
                
                if let subtitle {
                    Text(subtitle)
                        .font(AppFontConstants.title4)
                        .foregroundStyle(AppColorConstants.gray6)
                        .italic()
                }
                
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(AppColorConstants.gray3)
            .clipShape(RoundedRectangle(cornerRadius: 50))
        }
    }
}

struct DatePickerView: View {
    @Binding var selectedDate: Date?
    
    init(selectedDate: Binding<Date?>) {
        self._selectedDate = selectedDate
    }
    
    init(selectedDate: Binding<Date>) {
        self._selectedDate = Binding(
            get: { selectedDate.wrappedValue },
            set: { selectedDate.wrappedValue = $0 ?? Date() }
        )
    }
    
    var body: some View {
        DatePicker("", selection: Binding(
            get: {
                selectedDate ?? Date()
            },
            set: { newValue in
                selectedDate = newValue
            }
        ), displayedComponents: .date)
        .datePickerStyle(.graphical)
        .labelsHidden()
    }
}

#Preview {
    AdditionalDetailsRow()
        .environmentObject(TicketDetailsViewModel(enteredFromValue: "Минск", enteredToValue: "Вальхалла"))
}
