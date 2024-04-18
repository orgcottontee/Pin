//
//  FavoritesScreen.swift
//  JingPin
//
//  Created by adobada on 4/14/24.
//

import SwiftUI
import SwiftData

struct FavoritesScreen: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var favoriteBoutiques: [FavoriteBoutique] = []
        
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            VStack {
                LogoView(image: .appLogo, frameWidth: 80)
                    .shadow(color: .accent, radius: 1, x: 0, y: 1)
                Text(FavoritesScreenConstant.header)
                    .applyJPHeader(.accent)
                List {
                    ForEach(favoriteBoutiques) { boutique in
                        HStack {
                            Text(boutique.name)
                            Text(boutique.city)
                            Text(boutique.state)
                            Text(boutique.website)
                        }
                    }
                    .onDelete(perform: removeFromFavorites(_:))
                }
                .scrollContentBackground(.hidden)
            }
            .padding()
        }
    }
    
    func removeFromFavorites(_ indexSet: IndexSet) {
        for index in indexSet {
            let boutique = favoriteBoutiques[index]
            modelContext.delete(boutique)
        }
    }
}

#Preview {
    FavoritesScreen()
}
