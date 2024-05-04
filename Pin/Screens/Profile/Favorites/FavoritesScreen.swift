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
    @Query(sort: \FavoriteBoutique.savedDate, order: .reverse) var favorites: [FavoriteBoutique]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.App.background.ignoresSafeArea()
                VStack {
                    Text("Your boutiques")
                        .applyJPBody(.App.accent)
                        .padding(.top)
                    List {
                        ForEach(favorites) { favorite in
                            NavigationLink {
                                FavoriteNotesScreen(favoriteBoutique: favorite)
                                    .toolbarRole(.editor)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(favorite.name)
                                        .applyJPSubheader(.App.accent)
                                    Text("\(favorite.city), \(favorite.state)")
                                        .applyJPBody(.App.accent)
                                }
                            }
                        }
                        .onDelete(perform: deleteFavProducts)
                    }
                    .scrollIndicators(.hidden)
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
