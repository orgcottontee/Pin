//
//  LogoView.swift
//  JingPin
//
//  Created by adobada on 4/11/24.
//

import SwiftUI

struct LogoView: View {
    
    var image: UIImage
    var frameWidth: CGFloat
    
    var body: some View {
        // TODO: Can use AsyncImage?
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: frameWidth)
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}
