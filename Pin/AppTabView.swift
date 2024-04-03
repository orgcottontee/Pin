//
//  AppTabView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct AppTabView: View {
    
    @State private var selected: Constants.TabIcon = .door
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            Color(.brandPrimary)
                .ignoresSafeArea()
            VStack {
                TabView(selection: $selected) {
                    BoutiqueListScreen()
                        .tag(Constants.TabIcon.door)
                    BoutiqueMapScreen()
                        .tag(Constants.TabIcon.map)
                    ProfileScreen()
                        .tag(Constants.TabIcon.profile)
                }
                .tint(.brown)
                TabBarView(selected: $selected)
            }
        }
    }
}

#Preview {
    AppTabView()
}
