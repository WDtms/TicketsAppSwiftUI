//
//  OfferItemView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct OfferItemView: View {
    private let itemWidth: CGFloat = 132
    
    let offerItem: OfferItem
    
    var body: some View {
        VStack(spacing: 8) {
            
            Image(offerItem.imagePath)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: itemWidth, height: 133.16)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text(offerItem.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(AppFontConstants.title3)
                .foregroundStyle(AppColorConstants.white)
            
            Text(offerItem.town)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(AppFontConstants.text2)
                .foregroundStyle(AppColorConstants.white)
            
            HStack {
                
                Image(AppImageConstants.flights)
                    .foregroundStyle(AppColorConstants.gray6)
                
                Text("От \(offerItem.price) ₽")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(AppFontConstants.text2)
                    .foregroundStyle(AppColorConstants.white)
            }
            
        }
        .frame(width: itemWidth, height: 214)
    }
}

#Preview {
    ZStack {
        AppColorConstants.black.edgesIgnoringSafeArea(.all)
        
        OfferItemView(
            offerItem: OfferItem(
                id: 1,
                title: "Title",
                town: "Town",
                price: "25 000",
                imagePath: "id-1"
            )
        )
    }
}
