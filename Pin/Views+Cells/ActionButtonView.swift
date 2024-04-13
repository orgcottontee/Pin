//
//  ActionButtonView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct ActionButtonView: View {
    
    var buttonText: String
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 40)
                .foregroundStyle(.appAccent)
                .padding(.horizontal)
            Text(buttonText)
                .font(.custom(BaskervilleFont.regular,size: 16))
                .kerning(1.5)
                .foregroundStyle(.appPrimary)
        }
    }
}

#Preview {
    ActionButtonView(buttonText: "colbo.nyc")
}