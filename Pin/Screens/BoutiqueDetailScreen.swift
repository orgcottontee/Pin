//
//  BoutiqueDetailScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI
import CloudKit

struct BoutiqueDetailScreen: View {
    
    var boutiqueLocation: UnitedStatesBoutique
    @State private var isFavorite = false
    @StateObject private var manager = FavoritesManager()
    
    var body: some View {
        
        ZStack {
            Color(.appPrimary).ignoresSafeArea()
            VStack(alignment: .leading) {
                NameView(name: boutiqueLocation.name)
                BannerImageView(image: boutiqueLocation.createBannerImage())
                Spacer()
                HStack {
                    FullAddressView(address: boutiqueLocation.address,
                                    cityStatePostalCode: "\(boutiqueLocation.city), \(boutiqueLocation.state), \(boutiqueLocation.zipCode)")
                    Button {
                        withAnimation { isFavorite.toggle() }
                        let favorited = UnitedStatesBoutique(record: boutiqueLocation.record)
                        Task {
                            try await manager.addFavoritedBoutiques(favorited: favorited)
                        }
                    } label: {
                        Label("", systemImage: isFavorite ? "heart.fill": "heart")
                            .foregroundStyle(.favorited)
                            .frame(width: 40, height: 40)
                    }
                    .contentTransition(.symbolEffect(.replace))
                }
                .padding(.bottom)
            
                ScrollView {
                    VStack(alignment: .leading) {
                        AboutDetailView(aboutText: boutiqueLocation.boutiqueStory)
                    }
                }
                
                CategoryView(categories: boutiqueLocation.categories)
                Link(destination: URL(string: boutiqueLocation.websiteURL)!) { ActionButtonView(buttonText: "Visit \(boutiqueLocation.shortURL)") }
            }
            .padding()
        }
        
    }
}

#Preview {
    BoutiqueDetailScreen(boutiqueLocation: UnitedStatesBoutique(record: MockData.boutiqueLocation))
}

@MainActor
final class FavoritesManager: ObservableObject {
    
    private let container = CKContainer.default().privateCloudDatabase
    @Published private var favoritedDictionary: [CKRecord.ID: UnitedStatesBoutique] = [:]
    
    func addFavoritedBoutiques(favorited: UnitedStatesBoutique) async throws {
        let _ = try await container.save(favorited.record)
    }
}

fileprivate struct NameView: View {
    
    var name: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(name).applyJPSubheader()
        }
    }
}

fileprivate struct FullAddressView: View {
    
    var address: String
    var cityStatePostalCode: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(address)
                Text(cityStatePostalCode)
            }
            .applyJPBody()
            Spacer()
        }
    }
}

fileprivate struct AboutDetailView: View {
    
    var aboutText: String
    
    var body: some View {
        Text(aboutText).applyJPBody()
    }
}

fileprivate struct CategoryView: View {
    
    var categories: [String]
   
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(categories, id: \.self) { category in
                    HStack {
                        Image(systemName: "square.fill").font(.system(size: 4))
                        Text(category).applyJPBody()
                    }
                }
            }
            .padding(.vertical)
            Spacer()
        }
    }
}
