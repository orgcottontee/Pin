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
        HStack(spacing: 30) {
            Image(uiImage: boutiqueLocation.createSquareLogo())
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
//                .clipShape(RoundedRectangle(cornerRadius: 6))
            Spacer()
            BoutiqueCellWordsView(name: boutiqueLocation.name,
                                  cityState: "\(boutiqueLocation.city), \(boutiqueLocation.state)")
        }
        .padding(.horizontal)
    }
}

#Preview {
    BoutiqueCellView(boutiqueLocation: UnitedStatesBoutique(record: MockData.boutiqueLocation))
}

fileprivate struct BoutiqueCellWordsView: View {
    
    var name: String
    var cityState: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.custom(BaskervilleFont.regular, size: 20))
                .lineLimit(1)
                .minimumScaleFactor(0.75)
            Text(cityState)
                .font(.custom(UniversFont.light, size: 16))
        }
        .kerning(1.5)
    }
}
