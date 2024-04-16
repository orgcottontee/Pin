//
//  BoutiqueDetailScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI
import CloudKit

struct BoutiqueDetailScreen: View {
    
    @ObservedObject var viewModel: BoutiqueDetailViewModel
    
    var body: some View {
        ZStack {
            Color(.appPrimary).ignoresSafeArea()
            VStack(alignment: .leading) {
                NameView(name: viewModel.boutiqueLocation.name)
                BannerImageView(image: viewModel.boutiqueLocation.createBannerImage())
                Spacer()
                HStack {
                    FullAddressView(address: viewModel.boutiqueLocation.address,
                                    cityStatePostalCode: "\(viewModel.boutiqueLocation.city), \(viewModel.boutiqueLocation.state), \(viewModel.boutiqueLocation.zipCode)")
                    Button {
                        viewModel.navigateToBoutique()
                    } label: {
                        Image(systemName: NavigateIcon.sfSymbol)
                            .applyJPSubheader()
                            .frame(width: 40, height: 40)
                    }
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

fileprivate struct FooterView: View {
    
    var categories: [String]
   
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(categories, id: \.self) { category in
                HStack {
                    Image(systemName: "square.fill").font(.system(size: 4))
                    Text(category).applyJPBody()
                    
                    
                }
            }
        }
        .padding(.vertical)
    }
}
