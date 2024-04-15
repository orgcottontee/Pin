//
//  FavoritesScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct FavoritesScreen: View {
    var body: some View {
        ZStack {
            // TODO: Logic for adding to favorites to display here, a heart on the main list screen, a heart for the map icons, and filled in heart on the details screen
            Color.appPrimary.ignoresSafeArea()
            Text("Hello, here are your favorite boutiques")
                .font(.custom(BaskervilleFont.boldItalic, size: 16))
        }
    }
}

#Preview {
    FavoritesScreen()
}
