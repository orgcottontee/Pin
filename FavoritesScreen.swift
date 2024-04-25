//
//  FavoritesScreen.swift
//  JingPin
//
//  Created by adobada on 4/22/24.
//

import SwiftUI
import SwiftData

struct FavoritesScreen: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var favoriteBoutiques: [FavoriteBoutique] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.App.background.ignoresSafeArea()
                VStack {
                    LogoView(image: .AppLogo.logo, frameWidth: 80)
                        .padding(.top, 50)
                    Text(FavoritesScreenConstant.header)
                        .applyJPHeader(.App.accent)
               
                        List {
                            ForEach(favoriteBoutiques) { favorite in
                                NavigationLink {
                                    FavoriteNotesScreen(favoriteBoutique: favorite)
                                } label: {
                                    Text(favorite.name)
                                }
                            }
                            .onDelete(perform: deleteFavProducts)
                        }
                        .scrollContentBackground(.hidden)
                    
                }
                .padding()
            }
        }
    }
    private func deleteFavProducts(_ indexSet: IndexSet) {
        for index in indexSet {
            let boutique = favoriteBoutiques[index]
            modelContext.delete(boutique)
        }
    }
}

//#Preview {
//    FavoritesScreen()
//}
