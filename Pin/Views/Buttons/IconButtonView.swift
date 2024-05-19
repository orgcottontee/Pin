//
//  IconButtonView.swift
//  JingPin
//
//  Created by adobada on 4/19/24.
//

import SwiftUI

struct IconButtonView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var icon: String
    var color: Color
    
    var body: some View {
        if dynamicTypeSize >= .xxxLarge {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .applyJPSubheader(color)
                .frame(width: 44, height: 44)
        } else {
            Image(systemName: icon)
                .applyJPSubheader(color)
                .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    IconButtonView(icon: "square.and.arrow.up", color: .App.favorite)
}
