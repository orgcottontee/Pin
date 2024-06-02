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
    @State private var note: String = ""
    @State private var showSafari: Bool = false
    @Query private var notes: [FavoriteNote]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ZStack {
            Color.App.background.ignoresSafeArea()
            VStack {
                TextField("Add notes", text: $note)
                    .applyJPTextfield()
                    .onSubmit {
                        let addedNote = FavoriteNote(note: note)
                        addedNote.favoriteBoutique = favoriteBoutique
                        note = ""
                    }
                List {
                    ForEach(favoriteBoutique.favoriteNotes ?? []) { note in
                        Text(note.note)
                    }
                    .onDelete(perform: deleteNote)
                }
                .padding(.bottom)
                .scrollIndicators(.hidden)
                .scrollContentBackground(.hidden)
                
                
                
                OpenSafariView(showSafari: $showSafari, title: "Visit \(favoriteBoutique.shortURL)", url: favoriteBoutique.website)
                    .padding(.bottom)
                Text("Saved to favorites on \(convertDate())")
                    .applyJPFootnote()
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(favoriteBoutique.name)
                    .applyJPBody(.App.accent)
            }
        }
    }
    
    private func deleteNote(_ indexSet: IndexSet) {
        for index in indexSet {
            let note = notes[index]
            modelContext.delete(note)
        }
    }
    
    private func convertDate() -> String {
        favoriteBoutique.savedDate.convertToWeekdayDayMonth()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FavoriteNote.self, configurations: config)

    
    return NavigationStack {
        FavoriteNotesScreen(favoriteBoutique: FavoriteBoutique(boutiqueID: "",
                                                               name: "MUKAE MÜZ",
                                                               city: "San Diego",
                                                               state: "California",
                                                               savedDated: .now,
                                                               website: "https://www.mukaemuz.co",
                                                               shortURL: "mukaemuz.co"))
                          
                           
            .modelContainer(container)
    }
}
