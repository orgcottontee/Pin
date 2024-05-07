//
//  OnboardingView.swift
//  JingPin
//
//  Created by adobada on 4/11/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.App.background.ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                       XDismissButtonView()
                    }
                }
                
                Spacer()
                
                LogoView(image: .AppLogo.logo, frameWidth: 150).padding(.bottom)
                
                VStack(alignment: .leading, spacing: 32) {
                    DetailView(title: OnboardingTextConstant.titleOne, description: OnboardingTextConstant.firstText)
                    DetailView(title: OnboardingTextConstant.titleTwo, description: OnboardingTextConstant.secondText)
                    DetailView(title: OnboardingTextConstant.titleThree, description: OnboardingTextConstant.thirdText)
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    OnboardingView()
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
