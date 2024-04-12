//
//  OnboardingView.swift
//  JingPin
//
//  Created by adobada on 4/11/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var isShowingOnboardingView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingOnboardingView = false
                } label: {
                    DismissButtonView()
                }
            }
            .padding()
            Spacer()
            LogoView(image: colorScheme == .dark ? .lightAppLogo : .darkAppLogo,
                     frameWidth: 200)
            .padding(.bottom)
            VStack(alignment: .leading) {
                InfoView(title: "Boutique Locations", description: OnboardingText.firstDescription)
                InfoView(title: "Coverage", description: OnboardingText.secondDescription)
                InfoView(title: "Create and share", description: OnboardingText.thirdDescription)
            }
            Spacer()
        }
    }
}

#Preview {
    OnboardingView(isShowingOnboardingView: .constant(true))
}

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

fileprivate struct DismissButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.appAccent)
            Image(systemName: "xmark")
                .foregroundStyle(.appPrimary)
                .imageScale(.small)
                .frame(width: 44, height: 44)
        }
    }
}
