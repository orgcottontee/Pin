//
//  ButtonView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonText: String
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 40)
                .foregroundStyle(.brandAccent)
            Text(buttonText)
                .font(.custom(BaskervilleFont.regular,size: 16))
                .kerning(1.5)
                .foregroundStyle(.brandPrimary)
        }
    }
}

#Preview {
    ButtonView(buttonText: "colbo.nyc")
}
