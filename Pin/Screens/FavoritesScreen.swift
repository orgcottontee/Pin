//
//  FavoritesScreen.swift
//  JingPin
//
//  Created by adobada on 4/14/24.
//

import SwiftUI

struct FavoritesScreen: View {
        
    var body: some View {
        ZStack {
            Color.appPrimary.ignoresSafeArea()
            VStack {
                BannerImageView(image: .appBanner)
                Text("Your saved boutiques")
                    .applyJPHeader()
                List(0..<3) { index in
                    Text("Item \(index)")
                        .applyJPBody()
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    FavoritesScreen()
}
