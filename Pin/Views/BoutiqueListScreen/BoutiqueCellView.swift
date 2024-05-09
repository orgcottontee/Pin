//
//  BoutiqueCellView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueCellView: View {
    
    var boutiqueLocation: UnitedStatesBoutique
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        if dynamicTypeSize <= .xxxLarge {
            VStack(alignment: .leading) {
                BrandNameView(name: boutiqueLocation.name)
                LogoCategoryView(image: boutiqueLocation.squareLogo,
                                 categories: boutiqueLocation.categories)
                CityStateView(city: boutiqueLocation.city, state: boutiqueLocation.state)
            }
            .padding()
        } else {
            VStack(alignment: .leading, spacing: 5) {
                LargeTextBrandNameView(name: boutiqueLocation.name)
                LogoView(image: boutiqueLocation.squareLogo, frameWidth: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 4, x: 2, y: 2)
                CityStateView(city: boutiqueLocation.city, state: boutiqueLocation.state)
            }
            .padding()
        }
    }
}

#Preview {
    BoutiqueCellView(boutiqueLocation: UnitedStatesBoutique(record: MockData.boutiqueLocation))
}

fileprivate struct BrandNameView: View {
    
    var name: String
    
    var body: some View {
        Text(name)
            .applyJPSubheader(.App.accent)
    }
}

fileprivate struct LogoCategoryView: View {
    
    var image: UIImage
    var categories: [String]
    
    var body: some View {
        HStack(spacing: 10) {
            LogoView(image: image, frameWidth: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .gray, radius: 4, x: 2, y: 2)
            VStack(alignment: .leading) {
                ForEach(categories, id: \.self) { category in
                    Text("• \(category)")
                        .applyJPFootnote()
                        .lineLimit(1)
//                        .minimumScaleFactor(0.50)
                }
            }
        }
    }
}

fileprivate struct CityStateView: View {
    
    var city: String
    var state: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(city),")
            Text(state)
        }
        .applyJPBody(.App.accent)
    }
}

fileprivate struct LargeTextBrandNameView: View {
    
    var name: String
    
    var body: some View {
        Text(name)
            .applyJPSubheader(.App.accent)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
    }
}
