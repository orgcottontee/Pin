//
//  AppTabView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct AppTabView: View {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some View {
        if hasSeenOnboarding {
            TabView {
                BoutiqueListScreen()
                    .tabItem { Label("", systemImage: "hanger") }
                BoutiqueMapScreen()
                    .tabItem { Label("", systemImage: "mappin") }
                ProfileScreen()
                    .tabItem { Label("", systemImage: "person") }
            }
            .tint(.appAccent)
        } else {
            OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
        }
    }
}

#Preview {
    AppTabView()
}
