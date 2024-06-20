//
//  MainTabView.swift
//  TicketsAppSwiftUI
//
//  Created by Aleksey Shepelev on 19.06.2024.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var ticketCoordinator = TicketCoordinator()
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(AppColorConstants.gray5)
    }
    
    var body: some View {
        TabView {
            TicketTabView()
                .tabItem {
                    VStack {
                        Image(AppImageConstants.flights)
                        Text("Авиабилеты")
                    }
                }
                .environmentObject(ticketCoordinator)
            HotelsTabView()
                .tabItem {
                    VStack {
                        Image(AppImageConstants.hotel)
                        Text("Отели")
                    }
                }
            ShorterTabView()
                .tabItem {
                    VStack {
                        Image(AppImageConstants.location)
                        Text("Короче")
                    }
                }
            SubscriptionsTabView()
                .tabItem {
                    VStack {
                        Image(AppImageConstants.bell)
                        Text("Подписки")
                    }
                }
            ProfileTabView()
                .tabItem {
                    VStack {
                        Image(AppImageConstants.profile)
                        Text("Профиль")
                    }
                }
        }
    }
}

#Preview {
    MainTabView()
}
