//
//  BoutiqueCellView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct BoutiqueCellView: View {
    
    var boutiqueLocation: UnitedStatesBoutique
    
    var body: some View {
        
        VStack(alignment: .leading) {
            BrandNameView(name: boutiqueLocation.name)
            BrandLogoView(image: boutiqueLocation.createSquareLogo())
            CityStateView(city: boutiqueLocation.city, state: boutiqueLocation.state)
            FooterCategoryView(categories: boutiqueLocation.categories)
        }
        .padding()
    }
}

#Preview {
    BoutiqueCellView(boutiqueLocation: UnitedStatesBoutique(record: MockData.boutiqueLocation))
}

fileprivate struct BrandNameView: View {
    
    var name: String
    
    var body: some View {
        HStack {
            Text(name)
                .applyJPHeader(.App.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.50)
            Spacer()
        }
        .frame(width: 300, height: 50)
    }
}

fileprivate struct BrandLogoView: View {
    
    var image: UIImage
    
    var body: some View {
        LogoView(image: image, frameWidth: 300)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray, radius: 4, x: 2, y: 2)
            .padding(.bottom)
    }
}

fileprivate struct CityStateView: View {
    
    var city: String
    var state: String
    
    var body: some View {
        Text("\(city), \(state)")
            .applyJPBody(.App.accent)
            .padding(.bottom)
    }
}

fileprivate struct FooterCategoryView: View {
    
    var categories: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading) {
                ForEach(categories, id: \.self) { category in
                    HStack {
                        Image(systemName: "square.fill").font(.system(size: 4))
                        Text(category)
                    }
                }
            }
            .applyJPFootnote()
        }
        .scrollIndicators(.hidden)
    }
}
