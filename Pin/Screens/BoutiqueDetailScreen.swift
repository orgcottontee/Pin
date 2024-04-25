//
//  BoutiqueDetailScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI
import SwiftData

struct BoutiqueDetailScreen: View {
    
    @State var viewModel: BoutiqueDetailViewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var favoriteBoutiques: [FavoriteBoutique]
    
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
                    Button {
                        viewModel.openMaps()
                    } label: {
                        SFSymbolView(icon: DetailScreenConstant.navigateIcon)
                    }
                    Button {
                        toggleToFavorite()
                    } label: {
                        Image(systemName: favoriteBoutiques.contains(where: { $0.boutiqueID == viewModel.boutiqueLocation.id.recordName }) ? "heart.fill" : "heart")
                            .foregroundStyle(Color(.App.favorite))
                            .applyJPSubheader()
                            .frame(width: 40, height: 40)
                    }
                    .contentTransition(.symbolEffect(.replace))
                    
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
    
    func toggleToFavorite() {
        
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
