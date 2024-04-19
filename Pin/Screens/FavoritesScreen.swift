//
//  FavoritesScreen.swift
//  JingPin
//
//  Created by adobada on 4/14/24.
//

import SwiftUI
import SwiftData

struct FavoritesScreen: View {
    
    @State private var isShowingSafari: Bool = false
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            VStack {
                LogoView(image: .appLogo, frameWidth: 80)
                    .shadow(color: .accent, radius: 1, x: 0, y: 1)
                Text(FavoritesScreenConstant.header)
                    .applyJPHeader(.accent)
            }
            .padding()
        }
    }
}

#Preview {
    FavoritesScreen()
}
