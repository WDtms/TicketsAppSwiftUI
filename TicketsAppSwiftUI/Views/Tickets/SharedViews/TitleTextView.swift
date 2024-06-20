//
//  TitleTextView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct TitleTextView: View {
    let title: String
    let textAlignment: Alignment
    let multilineTextAlignment: TextAlignment
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: textAlignment)
            .foregroundStyle(AppColorConstants.gray7)
            .font(.system(size: 22, weight: .semibold))
            .multilineTextAlignment(multilineTextAlignment)
            .lineSpacing(2.4)
    }
}

#Preview {
    TitleTextView(title: "Поиск дешевых", textAlignment: .leading, multilineTextAlignment: .trailing)
}
