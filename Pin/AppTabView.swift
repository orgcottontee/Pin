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
    
    enum Tab { case boutiqueList, boutiqueMap, favoriteScreen, profile }
    
    var body: some View {
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
            .tint(selectedTab == .boutiqueList ? .mainScreenAccent : .accent)
        } else {
            OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
        }
    }
}

#Preview {
    AppTabView()
        .environmentObject(BoutiqueManager())
}
