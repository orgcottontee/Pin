//
//  FavoriteNotesScreen.swift
//  JingPin
//
//  Created by adobada on 4/22/24.
//

import SwiftUI
import SwiftData

struct FavoriteNotesScreen: View {
    
    let favoriteBoutique: FavoriteBoutique
    @State private var text: String = ""
    @Query private var notes: [FavoriteNote]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack {
            Color.App.background.ignoresSafeArea()
            VStack {
                TextField("Add notes for \(favoriteBoutique.name)", text: $text)
                    .applyJPTextfield()
                    .onSubmit {
                        let note = FavoriteNote(text: text)
                        note.favoriteBoutique = favoriteBoutique
                        text = ""
                    }
                
                List {
                    ForEach(favoriteBoutique.favoriteNotes ?? []) { note in
                        Text(note.text)
                    }
                    .onDelete(perform: deleteNote)
                }
                .scrollContentBackground(.hidden)
                
                let convertedDate = favoriteBoutique.favoritedAt.convertToWeekdayDayMonth()
                Text("Saved on \(convertedDate)")
                    .applyJPFootnote(.secondary)
            }
            .padding()
        }
    }
    private func deleteNote(_ indexSet: IndexSet) {
        for index in indexSet {
            let note = notes[index]
            modelContext.delete(note)
        }
    }
}
