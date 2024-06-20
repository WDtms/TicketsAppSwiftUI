//
//  OffersView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct OffersView: View {
    @StateObject private var offersViewModel = OffersViewModel()
    
    var body: some View {
        Group {
            switch offersViewModel.state {
            case .success(let array):
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 67) {
                        ForEach(array) {
                            OfferItemView(offerItem: $0)
                        }
                    }
                    .fixedSize()
                }
        
            case .loading:
                Spacer()
                    .frame(height: 214)
            }
        }
    }
}

#Preview {
    ZStack {
        AppColorConstants.black.edgesIgnoringSafeArea(.all)
        
        OffersView()
    }
}
