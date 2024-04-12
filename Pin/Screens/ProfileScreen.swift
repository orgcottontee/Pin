//
//  ProfileScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct ProfileScreen: View {
    
    @State private var boutiqueName = ""
    @State private var country = ""
    @State private var website = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appPrimary
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    VStack(spacing: 10) {
                        TextField("Enter Boutique Name", text: $boutiqueName)
                            .padding(.horizontal)
                            .autocorrectionDisabled(true)
                        Rectangle()
                            .frame(height: 1)
                            .padding(.horizontal)
                            .foregroundColor(.gray)
                        TextField("Enter Country", text: $country)
                            .padding(.horizontal)                            
                            .autocorrectionDisabled(false)
                        Rectangle()
                            .frame(height: 1)
                            .padding(.horizontal)
                            .foregroundColor(.gray)
                        TextField("Enter Website", text: $website)
                            .padding(.horizontal)                            
                            .autocorrectionDisabled(true)
                        Rectangle()
                            .frame(height: 1)
                            .padding(.horizontal)
                            .foregroundColor(.gray)
                        ActionButtonView(buttonText: "Submit")
                            .padding(.horizontal)
                    }
                    .font(.custom(UniversFont.light, size: 14))
                    .kerning(1.2)
                    
                    Spacer()
                    NavigationLink(destination: SettingsScreen()) {
                        ActionButtonView(buttonText: "Settings")
                    }
                    NavigationLink(destination: FavoritesScreen()) {
                        ActionButtonView(buttonText: "Saved Boutiques")
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

