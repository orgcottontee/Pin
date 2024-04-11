//
//  ImageView.swift
//  JingPin
//
//  Created by adobada on 4/11/24.
//

import SwiftUI

struct ImageView: View {
    
    var image: UIImage
    
    var body: some View {
        // TODO: Can use AsyncImage
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .shadow(radius: 3)
    }
}
