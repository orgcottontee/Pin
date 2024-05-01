//
//  SplashScreenView.swift
//  JingPin
//
//  Created by adobada on 4/25/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        if isActive {
            AppTabView()
        } else {
            ZStack { 
                Color.App.background.ignoresSafeArea()
                VStack {
                    Image(.AppLogo.splashScreen)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .onAppear {
                            Task {
                                try await Task.sleep(nanoseconds: 2_000_000_000)
                                withAnimation {
                                    isActive = true
                                }
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
