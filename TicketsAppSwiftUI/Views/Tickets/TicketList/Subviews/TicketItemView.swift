//
//  TicketItemView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 20.06.2024.
//

import SwiftUI

struct TicketItemView: View {
    let ticket: TicketItem
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            VStack {
                
                Spacer().frame(height: 16)
                
                HStack {
                    
                    VStack {
                        
                        if ticket.badge != nil {
                            Spacer().frame(height: 5)
                        }
                        
                        Spacer().frame(height: 16)
                        
                        TitleTextView(
                            title: "\(ticket.price) ₽",
                            textAlignment: .leading,
                            multilineTextAlignment: .leading
                        )
                        
                        Spacer().frame(height: 16)
                        
                        HStack(alignment: .top, spacing: 0) {
                            
                            HStack(spacing: 0) {
                                Circle()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(AppColorConstants.red)
                                
                                Spacer().frame(width: 8)
                                
                                HStack(alignment: .top, spacing: 0) {
                                    
                                    AirportDateVStack(date: ticket.departure.date, airport: ticket.departure.airport)
                                    
                                    Text(" \u{2013} ")
                                        .font(AppFontConstants.title4)
                                        .foregroundStyle(AppColorConstants.gray6)
                                    
                                    AirportDateVStack(date: ticket.arrival.date, airport: ticket.arrival.airport)
                                    
                                }
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                
                                Text(ticket.flightLength)
                                    .font(AppFontConstants.text2)
                                    .foregroundStyle(AppColorConstants.white)
                                
                                if !ticket.hasTransfer {
                                    Text("/")
                                        .font(AppFontConstants.text2)
                                        .foregroundStyle(AppColorConstants.gray6)
                                    
                                    Text("Без пересадок")
                                        .font(AppFontConstants.text2)
                                        .foregroundStyle(AppColorConstants.white)
                                }
                                
                            }
                            
                        }
                        
                        Spacer().frame(height: 23)
                    }
                    .padding(.horizontal, 16)
                }
                .background(AppColorConstants.gray1)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            if let badge = ticket.badge {
                
                Text(badge)
                    .font(AppFontConstants.title4)
                    .italic()
                    .foregroundColor(AppColorConstants.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 2)
                    .background(AppColorConstants.blue)
                    .cornerRadius(50)
                    .offset(x: -16, y: -10)
                    .padding([.top, .leading], 16)
                
            }
            
        }
        
    }
}

fileprivate struct AirportDateVStack: View {
    let date: String
    let airport: String
    
    var body: some View {
        VStack {
            Text(date)
                .font(AppFontConstants.title4)
                .foregroundStyle(AppColorConstants.white)
                .italic()
            
            Spacer().frame(height: 4)
            
            Text(airport)
                .font(AppFontConstants.title4)
                .foregroundStyle(AppColorConstants.gray6)
                .italic()
        }
    }
}

#Preview {
    TicketItemView(ticket: TicketItem(id: 1, badge: "Прилет вечером", flightLength: "3.5ч в пути", price: "8 567", departure: TicketItem.AirportData(date: "17:45", airport: "DME"), arrival: TicketItem.AirportData(date: "21:20", airport: "AER"), hasTransfer: false))
}
