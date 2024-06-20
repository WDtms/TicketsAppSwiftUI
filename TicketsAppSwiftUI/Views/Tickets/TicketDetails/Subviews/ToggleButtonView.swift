//
//  ToggleButton.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct ToggleButtonView: View {
    @State private var isSubscribed: Bool = false

    var body: some View {
        Button(action: {
            self.isSubscribed.toggle()
        }) {
            
            HStack {
                
                Image(AppImageConstants.bell)
                    .foregroundColor(.blue)
                
                Text("Подписка на цену")
                    .font(AppFontConstants.text1)
                    .foregroundColor(.white)
                
                Spacer()
                
                CustomToggleView(isOn: $isSubscribed)
                    .labelsHidden()
                
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 13)
            .background(AppColorConstants.gray2)
            .cornerRadius(8)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

fileprivate struct CustomToggleView: View {
    @Binding var isOn: Bool

    var body: some View {
        
        Toggle("", isOn: $isOn)
            .toggleStyle(CustomToggleStyle())
            .cornerRadius(10)
        
    }
}

fileprivate struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 34, height: 14)
                .foregroundColor(configuration.isOn ? AppColorConstants.blue : AppColorConstants.gray5)
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(AppColorConstants.white)
                .offset(x: configuration.isOn ? 10 : -10)
                .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
            
        }
        .padding(.horizontal, 7)
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}

#Preview {
    ToggleButtonView()
}
