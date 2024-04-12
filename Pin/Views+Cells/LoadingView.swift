//
//  LoadingView.swift
//  JingPin
//
//  Created by adobada on 4/11/24.
//

import SwiftUI
import AVKit

struct LoadingView: View {
    
    @State private var isAnimating = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color(.appPrimary)
                .ignoresSafeArea()
            
            LogoView(image: colorScheme == .dark ? .lightAppLogo : .darkAppLogo,
                     frameWidth: 50)
                .scaleEffect(isAnimating ? 1.1 : 1)
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                self.isAnimating = true
            }
        }
    }
}

#Preview {
    LoadingView()
}
