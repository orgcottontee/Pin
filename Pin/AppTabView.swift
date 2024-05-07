//
//  AppTabView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct AppTabView: View {
    
    @StateObject private var viewModel = AppTabViewModel()
    @State private var selectedTab: Tab = .boutiqueList
    @State var isAccountStatusAlertShowing: Bool = false


    enum Tab { case boutiqueList, boutiqueMap, favoriteScreen, profile }

    var body: some View {
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
            .task {
                viewModel.checkIfHasSeenOnboard()
            }
            .sheet(isPresented: $viewModel.isShowingOnboardingView) {
                OnboardingView()
            }
    }
}

#Preview {
    AppTabView()
        .environment(BoutiqueManager())
}
