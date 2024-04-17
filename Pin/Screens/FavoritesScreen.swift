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
            Color.appBackground.ignoresSafeArea()
            VStack {
                LogoView(image: .appLogo, frameWidth: 80)
                    .shadow(color: .accent, radius: 1, x: 0, y: 1)
                Text(FavoritesScreenConstant.header)
                    .applyJPHeader(.accent)
                List(0..<3) { index in
                    Text("Item \(index)")
                        .applyJPBody(.accent)
                }
                .scrollContentBackground(.hidden)
            }
            .padding()
        }
    }
}

#Preview {
    FavoritesScreen()
}
