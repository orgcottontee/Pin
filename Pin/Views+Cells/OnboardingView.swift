//
//  OnboardingView.swift
//  JingPin
//
//  Created by adobada on 4/11/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var hasSeenOnboarding: Bool
    
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
            VStack {
                Spacer()
                LogoView(image: colorScheme == .dark ? .lightAppLogo : .darkAppLogo,
                         frameWidth: 200)
                .padding(.bottom)
                VStack(alignment: .leading) {
                    InfoView(title: OnboardingTextConstant.titleOne, description: OnboardingTextConstant.firstText)
                    InfoView(title: OnboardingTextConstant.titleTwo, description: OnboardingTextConstant.secondText)
                    InfoView(title: OnboardingTextConstant.titleThree, description: OnboardingTextConstant.secondText)
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

//#Preview {
//    OnboardingView(isShowingOnboardingView: .constant(true))
//}

fileprivate struct InfoView: View {
    
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.custom(BaskervilleFont.bold, size: 18))
            Text(description)
                .font(.custom(BaskervilleFont.regular, size: 16))
        }
        .kerning(1.5)
        .padding()
    }
}
