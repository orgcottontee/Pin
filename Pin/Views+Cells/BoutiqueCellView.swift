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
        
        VStack {
            ZStack(alignment: .topTrailing) {
                LogoView(image: boutiqueLocation.createSquareLogo(),
                         frameWidth: 250)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            CityStateView(city: boutiqueLocation.city, state: boutiqueLocation.state)
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    BoutiqueCellView(boutiqueLocation: UnitedStatesBoutique(record: MockData.boutiqueLocation))
}

fileprivate struct CityStateView: View {
    
    var city: String
    var state: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.App.placard)
                .frame(width: 250, height: 50)
                .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 6)
            Text("\(city), \(state)")
                .applyJPBody(.App.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
                .truncationMode(.tail)
        }
        .offset(x: 0, y: -20)
    }
}
