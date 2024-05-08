//
//  IconButtonView.swift
//  JingPin
//
//  Created by adobada on 4/19/24.
//

import SwiftUI

struct IconButtonView: View {
    
    var icon: String
    var color: Color
    
    var body: some View {
        Image(systemName: icon)
            .resizable()
            .scaledToFit()
            .applyJPSubheader(color)
            .frame(width: 44, height: 44)
    }
}

#Preview {
    IconButtonView(icon: "heart", color: .App.favorite)
}
