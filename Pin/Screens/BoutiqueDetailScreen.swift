//
//  BoutiqueDetailScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueDetailScreen: View {
    
    var boutiqueLocation: PinLocation
        
    var body: some View {
        
        ZStack {
            Color(.brandPrimary)
                .ignoresSafeArea()
            VStack {
                BoutiqueNameView(name: boutiqueLocation.name)
                BoutiqueLogoView()
                Spacer()
                BoutiqueInfoView(address: boutiqueLocation.address,
                                 cityStatePostalCode: "\(boutiqueLocation.city), \(boutiqueLocation.state), \(boutiqueLocation.postalCode)",
                                 categories: boutiqueLocation.categories
                )
                ScrollView {
                    Text(boutiqueLocation.brandStory)
                        .font(.custom(UniversFont.light, size: 16))
                }
                .padding(.bottom)
                
                Link(destination: URL(string: boutiqueLocation.websiteURL)!) { ButtonView(buttonText: Constants.shortURL.toiro) }
            }
            .padding()
        }
        
    }
}

#Preview {
    BoutiqueDetailScreen(boutiqueLocation: PinLocation(record: MockData.boutiqueLocation))
}

fileprivate struct BoutiqueLogoView: View {
    
    var body: some View {
        // TODO: Can use AsyncImage
        // TODO: Can do .white in dark mode and .gray in light mode for shadow
        Image(.sampleRec)
            .resizable()
            .scaledToFit()
            .shadow(radius: 3)
    }
}

fileprivate struct BoutiqueNameView: View {
    
    var name: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(name)
                .font(.custom(BaskervilleFont.italic, size: 30))
                .kerning(1.5)
        }
    }
}

fileprivate struct BoutiqueInfoView: View {
    
    var address: String
    var cityStatePostalCode: String
    var categories: [String]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(address)
                Text(cityStatePostalCode)
                    .padding(.bottom)
                ForEach(categories, id: \.self) { category in
                        Text(category)
                        .font(.custom(UniversFont.light, size: 16))
                }
            }
            .font(.custom(UniversFont.light, size: 16))
            .kerning(1.5)
            Spacer()
        }
        .padding(.vertical)
    }
}
