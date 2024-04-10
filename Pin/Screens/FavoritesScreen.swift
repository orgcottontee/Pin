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
            Color.appPrimary
                .ignoresSafeArea()
            Text("Hello, here are your favorite boutiques")
                .font(.custom(BaskervilleFont.boldItalic, size: 16))
        }
    }
}

#Preview {
    FavoritesScreen()
}
