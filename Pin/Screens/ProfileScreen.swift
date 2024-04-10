//
//  ProfileScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct ProfileScreen: View {
    
    @State var textInput: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appPrimary
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("Know a special boutique? Let us know!")
                        .font(.custom(BaskervilleFont.regular, size: 16))
                        .kerning(1.5)
                    TextField("", 
                              text: $textInput,
                              prompt: Text("Please share the name and location").foregroundStyle(.appPrimary))
                        // TODO: Add logic and send to backend
                    .padding()
                    .background(Color.appAccent)
                    .font(.custom(UniversFont.light, size: 16))
                    .kerning(1.2)
                    .foregroundStyle(.appAccent)
                    .autocorrectionDisabled(true)
                    
                    Spacer()
                    NavigationLink(destination: SettingsScreen()) {
                        ButtonView(buttonText: "Go to Settings")
                    }
                    NavigationLink(destination: FavoritesScreen()) {
                        ButtonView(buttonText: "See your Favorite Boutiques")
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
