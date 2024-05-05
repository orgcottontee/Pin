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
                LogoView(image: .AppLogo.logo, frameWidth: 150)
                Spacer()
                VStack(alignment: .leading) {
                    DetailView(title: OnboardingTextConstant.titleOne, description: OnboardingTextConstant.firstText)
                    DetailView(title: OnboardingTextConstant.titleTwo, description: OnboardingTextConstant.secondText)
                    DetailView(title: OnboardingTextConstant.titleThree, description: OnboardingTextConstant.thirdText)
                }
                Spacer()
                Button {
                    hasSeenOnboarding = true
                } label: {
                    ActionButtonView(buttonText: OnboardingTextConstant.buttonText)
                }
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingView(hasSeenOnboarding: .constant(true))
}

fileprivate struct DetailView: View {
    
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .applyJPSubheader(.App.accent)
            Text(description)
                .applyJPBody(.App.accent)
        }
        .padding(.bottom)
    }
}
