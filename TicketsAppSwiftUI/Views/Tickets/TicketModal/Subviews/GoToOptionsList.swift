//
//  GoToOptionsList.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct GoToOptionsList: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            OptionView(
                title: "Стамбул",
                imagePath: AppImageConstants.istanbul
            )
            
            Divider()
                .background(AppColorConstants.gray5)
            
            OptionView(
                title: "Сочи",
                imagePath: AppImageConstants.sochi
            )
            
            Divider()
                .background(AppColorConstants.gray5)
            
            OptionView(
                title: "Пхукет",
                imagePath: AppImageConstants.phuket
            )
            
            Divider()
                .background(AppColorConstants.gray5)
        }
        .padding(.all, 16)
        .frame(maxWidth: .infinity)
        .background(AppColorConstants.gray3)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ZStack {
        AppColorConstants.gray2
        
        GoToOptionsList()
    }
}


fileprivate struct OptionView: View {
    @EnvironmentObject private var viewModel: TicketModalViewModel
    
    let title: String
    let imagePath: String
    
    var body: some View {
        Button(action: {
            viewModel.enterProposedOption(with: title)
        }, label: {
            HStack {
                Image(imagePath)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(AppFontConstants.title3)
                        .foregroundStyle(AppColorConstants.white)
                    
                    Spacer().frame(height: 4)
                    
                    Text("Популярное направление")
                        .font(AppFontConstants.text2)
                        .foregroundStyle(AppColorConstants.gray5)
                }
            }
        })
    }
}
