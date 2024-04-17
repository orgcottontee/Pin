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
                .foregroundStyle(.accent)
                .padding(.horizontal)
            Text(buttonText)
                .foregroundStyle(.appBackground)
                .applyJPBody(.accent)
        }
    }
}

#Preview {
    ActionButtonView(buttonText: "colbo.nyc")
}
