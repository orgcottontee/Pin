//
//  ShapesView.swift
//  JingPin
//
//  Created by adobada on 4/16/24.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        
        ScrollView {
            ForEach(0..<50) { image in
                Image(.sampleSq)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Los Angeles,")
                Text("California")
            }
        }
    }
}

#Preview {
    ShapesView()
}
