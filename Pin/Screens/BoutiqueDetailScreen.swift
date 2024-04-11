//
//  BoutiqueDetailScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueDetailScreen: View {
    
    var boutiqueLocation: UnitedStatesBoutique
        
    var body: some View {
        
        ZStack {
            Color(.appPrimary)
                .ignoresSafeArea()
            VStack {
                BoutiqueNameView(name: boutiqueLocation.name)
                ImageView(image: boutiqueLocation.createLocationImage())
                Spacer()
                BoutiqueInfoView(address: boutiqueLocation.address,
                                 cityStatePostalCode: "\(boutiqueLocation.city), \(boutiqueLocation.state), \(boutiqueLocation.zipCode)",
                                 categories: boutiqueLocation.categories
                )
                ScrollView {
                    Text(boutiqueLocation.boutiqueStory)
                        .font(.custom(UniversFont.light, size: 16))
                }
                .padding(.bottom)
                
                Link(destination: URL(string: boutiqueLocation.websiteURL)!) { ButtonView(buttonText: boutiqueLocation.shortURL) }
            }
            .padding()
        }
        
    }
}

#Preview {
    BoutiqueDetailScreen(boutiqueLocation: UnitedStatesBoutique(record: MockData.boutiqueLocation))
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
