//
//  NumberFormat+Ext.swift
//  TicketsSwiftUI
//
//  Created by Aleksey Shepelev on 18.06.2024.
//

import Foundation

extension NumberFormatter {
    static let spaced: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}
