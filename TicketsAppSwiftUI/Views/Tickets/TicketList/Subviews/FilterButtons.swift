//
//  FilterButtons.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 20.06.2024.
//

import SwiftUI

struct FilterButtons: View {
    var body: some View {
        HStack(spacing: 0) {
            
            FilterButton(imagePath: AppImageConstants.filters, title: "Фильтры")
            
            Spacer().frame(width: 17)

            FilterButton(imagePath: AppImageConstants.graph, title: "График цен")
            
        }
        .padding(.all, 10)
        .background(AppColorConstants.blue)
        .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}

fileprivate struct FilterButton: View {
    let imagePath: String
    let title: String
    
    var body: some View {
        Button {
            
        } label: {
            
            HStack(spacing: 0) {
                Image(imagePath)
                    .foregroundStyle(AppColorConstants.white)
                
                Spacer().frame(width: 4)
                
                Text(title)
                    .font(AppFontConstants.title4)
                    .foregroundStyle(AppColorConstants.white)
            }
            
        }
    }
}

#Preview {
    FilterButtons()
}
