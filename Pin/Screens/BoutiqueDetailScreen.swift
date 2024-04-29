//
//  BoutiqueDetailScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI
import SwiftData

struct BoutiqueDetailScreen: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var favoriteBoutiques: [FavoriteBoutique]
    @Bindable var viewModel: BoutiqueDetailViewModel
    
    var body: some View {
        ZStack {
            Color.App.background.ignoresSafeArea()
            VStack(alignment: .leading) {
                NameView(name: viewModel.boutiqueLocation.name)
                BannerImageView(image: viewModel.boutiqueLocation.createBannerImage())
                Spacer()
                HStack {
                    FullAddressView(address: viewModel.boutiqueLocation.address,
                                    cityStatePostalCode: "\(viewModel.boutiqueLocation.city), \(viewModel.boutiqueLocation.state), \(viewModel.boutiqueLocation.zipCode)")
                    MapsButtonView(action: viewModel.openMaps)
                    FavoriteButtonView(isFavorite: favoriteBoutiques.contains(where: { $0.boutiqueID == viewModel.boutiqueLocation.id.recordName }), action: toggleToFavorite)
                }
                .padding(.bottom)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        AboutDetailView(aboutText: viewModel.boutiqueLocation.boutiqueStory)
                    }
                }
                
                FooterView(categories: viewModel.boutiqueLocation.categories)
                SafariView(showSafari: $viewModel.showSafari, title: "Visit \(viewModel.boutiqueLocation.shortURL)", url: viewModel.boutiqueLocation.websiteURL)
            }
            .padding()
        }
    }
    
    private func toggleToFavorite() {
        
        let boutiqueID = viewModel.boutiqueLocation.id.recordName
        
        if let existingFavoriteIndex = favoriteBoutiques.firstIndex(where: { $0.boutiqueID == boutiqueID }) {
            let existingFavorite = favoriteBoutiques[existingFavoriteIndex]
            modelContext.delete(existingFavorite)
            print("Already favorited. Removed from favorites.")
        } else {
            let favorite = FavoriteBoutique(boutiqueID: boutiqueID, favoritedAt: .now, name: viewModel.boutiqueLocation.name)
            modelContext.insert(favorite)
            print("Successfully added to favorites.")
        }
    }
}

#Preview {
    BoutiqueDetailScreen(viewModel: BoutiqueDetailViewModel(boutiqueLocation: UnitedStatesBoutique(record: MockData.boutiqueLocation)))
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
            .applyJPBody(.App.accent)
            Spacer()
        }
    }
}

fileprivate struct MapsButtonView: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            SFSymbolView(icon: DetailScreenConstant.navigateIcon)
        }
    }
}

fileprivate struct FavoriteButtonView: View {
    
    var isFavorite: Bool
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
            playHaptic()
        } label: {
            SFSymbolView(icon: isFavorite ? DetailScreenConstant.favorited : DetailScreenConstant.heart)
            // TODO: Implement favorite color from asset folder
        }
        .contentTransition(.symbolEffect(.replace))
    }
}


fileprivate struct AboutDetailView: View {
    
    var aboutText: String
    
    var body: some View {
        Text(aboutText).applyJPBody(.App.accent)
    }
}

fileprivate struct FooterView: View {
    
    var categories: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(categories, id: \.self) { category in
                HStack {
                    Image(systemName: "square.fill").font(.system(size: 4))
                    Text(category).applyJPBody(.App.accent)
                    
                    
                }
            }
        }
        .padding(.vertical)
    }
}
