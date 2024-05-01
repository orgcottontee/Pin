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
//    @Query private var favoriteBoutiques: [FavoriteBoutique] = []
    @Query(sort: \FavoriteBoutique.savedDate, order: .reverse) var favorites: [FavoriteBoutique]

    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.App.background.ignoresSafeArea()
                VStack {
                    Text(FavoritesScreenConstant.header)
                        .applyJPHeader(.App.accent)
               
                        List {
                            ForEach(favorites) { favorite in
                                NavigationLink {
                                    FavoriteNotesScreen(favoriteBoutique: favorite)
                                        .toolbarRole(.editor)
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
            let boutique = favorites[index]
            modelContext.delete(boutique)
        }
    }
}
