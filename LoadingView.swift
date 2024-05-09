//
//  LoadingView.swift
//  JingPin
//
//  Created by adobada on 5/8/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.App.background)
                .opacity(0.8)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .App.accent))
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
