//
//  BannerImageView.swift
//  JingPin
//
//  Created by adobada on 4/15/24.
//

import SwiftUI

struct BannerImageView: View {
    
    var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 300)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .shadow(color: .gray, radius: 4, x: 2, y: 2)
    }
}
