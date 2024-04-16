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
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding(.bottom)
    }
}

// TODO: Can use AsyncImage?
