//
//  RecomendationsView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct RecommendationsView: View {
    @StateObject private var recommendationsViewModel: RecommendationsViewModel = RecommendationsViewModel()
    
    var body: some View {
        Group {
            switch recommendationsViewModel.state {
            case .success(let array):
                let cuttedArray = array.prefix(3)
                
                VStack(spacing: 8) {
                    
                    TitleTextView(
                        title: "Прямые рельсы",
                        textAlignment: .leading,
                        multilineTextAlignment: .leading
                    )

                    RecommendationItemView(
                        recommendationItem: cuttedArray[0], 
                        circleColor: AppColorConstants.red
                    )
                    
                    Divider()
                        .background(AppColorConstants.gray5)
                    
                    RecommendationItemView(
                        recommendationItem: cuttedArray[1],
                        circleColor: AppColorConstants.blue
                    )
                    
                    Divider()
                        .background(AppColorConstants.gray5)
                    
                    RecommendationItemView(
                        recommendationItem: cuttedArray[2],
                        circleColor: AppColorConstants.white
                    )
                    
                    Divider()
                        .background(AppColorConstants.gray5)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Показать все")
                            .font(.system(size: 16))
                            .foregroundStyle(AppColorConstants.blue)
                    })
                    .frame(height: 42)
                }
                .padding(.all, 16)
                .background(AppColorConstants.gray1)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            case .loading:
                ZStack {
                    ProgressView()
                }
                .frame(height: 288)
            }
        }
    }
}

#Preview {
    RecommendationsView()
}
