//
//  AppTabView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct AppTabView: View {
    
    @State private var selected: TabIcon = .door
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            Color(.appPrimary)
                .ignoresSafeArea()
            if hasSeenOnboarding {
                VStack {
                    TabView(selection: $selected) {
                        BoutiqueListScreen()
                            .tag(TabIcon.door)
                        BoutiqueMapScreen()
                            .tag(TabIcon.map)
                        ProfileScreen()
                            .tag(TabIcon.profile)
                    }
                    .tint(.brown)
                    TabBarView(selected: $selected)
                }
            } else {
                OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
            }
        }
    }
}

#Preview {
    AppTabView()
}
