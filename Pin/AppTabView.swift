//
//  AppTabView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct AppTabView: View {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @State private var selectedTab: Tab = .boutiqueList
    @EnvironmentObject private var networkMonitor: NetworkMonitor
    
    enum Tab { case boutiqueList, boutiqueMap, favoriteScreen, profile }
    
    var body: some View {
        if networkMonitor.isConnected {
            if hasSeenOnboarding {
                TabView(selection: $selectedTab) {
                    BoutiqueListScreen()
                        .tabItem { Label("", systemImage: "hanger") }
                        .tag(Tab.boutiqueList)
                    BoutiqueMapScreen()
                        .tabItem { Label("", systemImage: "mappin") }
                        .tag(Tab.boutiqueMap)
                    FavoritesScreen()
                        .tabItem { Label("", systemImage: "heart.fill") }
                        .tag(Tab.favoriteScreen)
                    ProfileScreen()
                        .tabItem { Label("", systemImage: "person") }
                        .tag(Tab.profile)
                }
                .tint(.App.accent)
            } else {
                OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
            }
        } else {
            NetworkUnavailableScreen()
        }
    }
}

#Preview {
    AppTabView()
        .environment(BoutiqueManager())
}
