//
//  RecommendationItemView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct RecommendationItemView: View {
    let recommendationItem: RecommendationItem
    let circleColor: Color
    
    var body: some View {
        HStack {
            
            Circle()
                .frame(width: 24, height: 24)
                .foregroundStyle(circleColor)
            
            Spacer().frame(width: 8)
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 0) {
                    
                    Text(recommendationItem.title)
                        .foregroundStyle(AppColorConstants.white)
                        .font(AppFontConstants.title4)
                        .italic()
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Spacer()
                    
                    Text("\(recommendationItem.price) ₽")
                        .foregroundStyle(AppColorConstants.blue)
                        .font(AppFontConstants.title4)
                        .italic()
                    
                    Image(AppImageConstants.rightArrowIcon)
                        .foregroundStyle(AppColorConstants.blue)
                }
                
                Spacer().frame(height: 4)
                
                Text(recommendationItem.timeRange.joined(separator: " "))
                    .foregroundStyle(AppColorConstants.white)
                    .font(AppFontConstants.text2)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
            }
            
            
        }
    }
}

#Preview {
    ZStack {
        AppColorConstants.gray1
        
        RecommendationItemView(recommendationItem: RecommendationItem(id: 1, title: "Уральские пельмени", timeRange: ["07:00", "08:00", "09:00", "02:00", "07:00", "08:00", "09:00", "07:00", "08:00", "09:00",], price: "25 000"), circleColor: AppColorConstants.red)
    }
}
