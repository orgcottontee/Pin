//
//  ProfileScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct ProfileScreen: View {
    
    @AppStorage("appTheme") var selectedAppTheme = AppTheme.system
    
    var selectedTheme: ColorScheme? {
        switch selectedAppTheme {
        case .lightTheme:
            return .light
        case .darkTheme:
            return .dark
        case .system:
            return nil
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.App.background.ignoresSafeArea()
                VStack(spacing: 20) {
                    Spacer()
                    HStack {
                        Button { selectedAppTheme = .lightTheme} label: { ActionButtonView(buttonText: AppTheme.lightTheme.rawValue) }
                        Button { selectedAppTheme = .darkTheme } label: { ActionButtonView(buttonText: AppTheme.darkTheme.rawValue) }
                        Button { selectedAppTheme = .system } label: { ActionButtonView(buttonText: AppTheme.system.rawValue) }
                    }
                    NavigationLink(destination: UserSubmissionScreen()) {
                        ActionButtonView(buttonText: ProfileScreenConstant.submissionFormButton)
                    }
                    Spacer()
                    ShareLink(item: URL(string: "https://apps.apple.com/us/app")!) {
                        HStack {
                            Image(.AppLogo.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            Text("Share with a friend")
                                .applyJPFootnote(.App.accent)
                        }
                    }
                }
                .preferredColorScheme(selectedTheme)
            }
        }
        .tint(.App.accent)
    }
}

#Preview {
    ProfileScreen()
}

