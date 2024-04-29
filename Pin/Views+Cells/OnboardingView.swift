//
//  OnboardingView.swift
//  JingPin
//
//  Created by adobada on 4/11/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var hasSeenOnboarding: Bool
    
    var body: some View {
        ZStack {
            Color.App.background.ignoresSafeArea()
            VStack {
                Spacer()
                ZStack {
                    LogoView(image: .AppLogo.logo,
                             frameWidth: 150)
                }
                Spacer()
                VStack(alignment: .leading) {
                    InfoView(title: OnboardingTextConstant.titleOne, description: OnboardingTextConstant.firstText)
                    InfoView(title: OnboardingTextConstant.titleTwo, description: OnboardingTextConstant.secondText)
                    InfoView(title: OnboardingTextConstant.titleThree, description: OnboardingTextConstant.thirdText)
                }
                Spacer()
                Button {
                    hasSeenOnboarding = true
                } label: {
                    ActionButtonView(buttonText: "Let's go!")
                }
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingView(hasSeenOnboarding: .constant(true))
}

fileprivate struct InfoView: View {
    
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).applyJPSubheader(.App.accent)
            Text(description).applyJPBody(.App.accent)
        }
        .padding()
    }
}
