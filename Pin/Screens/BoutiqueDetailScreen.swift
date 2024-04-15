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
            Color(.appPrimary).ignoresSafeArea()
            VStack(alignment: .leading) {
                NameView(name: boutiqueLocation.name)
                LocationImageView(image: boutiqueLocation.createLocationImage())
                Spacer()
                HStack {
                    FullAddressView(address: boutiqueLocation.address,
                                    cityStatePostalCode: "\(boutiqueLocation.city), \(boutiqueLocation.state), \(boutiqueLocation.zipCode)")
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

fileprivate struct NameView: View {
    
    var name: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(name)
                .font(.custom(BaskervilleFont.italic, size: 26))
                .kerning(1.5)
        }
    }
}

fileprivate struct LocationImageView: View {
    
    var image: UIImage
    
    var body: some View {
        // TODO: Can use AsyncImage?
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 360)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding(.bottom)
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
            .font(.custom(UniversFont.light, size: 14))
            .kerning(1.5)
            Spacer()
        }
    }
}

fileprivate struct AboutDetailView: View {
    
    var aboutText: String
    
    var body: some View {
        Text(aboutText)
            .font(.custom(UniversFont.light, size: 14))
            .kerning(1.5)
    }
}

fileprivate struct CategoryView: View {
    
    var categories: [String]
   
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                ForEach(categories, id: \.self) { category in
                    HStack {
                        Image(systemName: "square.fill")
                            .font(.system(size: 4))
                        Text(category)
                            .font(.custom(UniversFont.light, size: 14))
                            .kerning(1.5)
                    }
                }
            }
            .padding(.vertical)
            Spacer()
        }
    }
}
