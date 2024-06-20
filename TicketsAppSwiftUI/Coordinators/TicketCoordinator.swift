//
//  TicketCoordinator.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import Foundation
import SwiftUI

class TicketCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
    @Published var showModal = false
    
    func showModalView() {
        showModal = true
    }
    
    func hideModalView() {
        showModal = false
    }
    
    func navigateToDetails(with value: TicketDetailsInitialData) {
        navigationPath.append(value)
    }
    
    func navigateToTicketsList(with value: TicketListInitialData) {
        navigationPath.append(value)
    }
    
    func pop() {
        navigationPath.removeLast()
    }
}
