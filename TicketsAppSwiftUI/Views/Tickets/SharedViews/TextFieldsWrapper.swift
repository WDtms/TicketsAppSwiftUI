//
//  TextFieldsWrapper.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 20.06.2024.
//

import SwiftUI

struct TextFieldsWrapper<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            ZStack {
                content
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .background(AppColorConstants.gray4)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 5)
        }
        .padding(.all, 16)
        .background(AppColorConstants.gray3)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    TextFieldsWrapper {
        Text("test")
    }
}
