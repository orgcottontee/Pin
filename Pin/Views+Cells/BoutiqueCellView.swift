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
            LogoView(image: boutiqueLocation.createSquareLogo(),
                     frameWidth: 150)
            InfoView(city: boutiqueLocation.city, state: boutiqueLocation.state)
        }
        .frame(width: 150)
        .padding(.bottom, 30)
    }
}

#Preview {
    BoutiqueCellView(boutiqueLocation: UnitedStatesBoutique(record: MockData.boutiqueLocation))
}

fileprivate struct InfoView: View {
    
    var city: String
    var state: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(city), \(state)")
                .lineLimit(1)
                .minimumScaleFactor(0.75)
                .truncationMode(.tail)
        }
        .font(.custom(UniversFont.light, size: 14))
        .kerning(1.8)
    }
}
