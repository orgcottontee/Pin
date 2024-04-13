//
//  ProfileScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct ProfileScreen: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appPrimary
                    .ignoresSafeArea()
                VStack {
                    NavigationLink(destination: SettingsScreen()) {
                        ActionButtonView(buttonText: ProfileScreenButton.settings)
                    }
                    NavigationLink(destination: FavoritesScreen()) {
                        ActionButtonView(buttonText: ProfileScreenButton.favorites)
                    }
                    NavigationLink(destination: UserSubmissionScreen()) {
                        ActionButtonView(buttonText: ProfileScreenButton.submission)
                    }
                }
                .padding()
            }
        }
        .tint(.appAccent)
    }
}

#Preview {
    ProfileScreen()
}

