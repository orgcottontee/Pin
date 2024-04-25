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
                VStack(spacing: 50) {
                    HStack {
                        Button { selectedAppTheme = .lightTheme} label: { ActionButtonView(buttonText: AppTheme.lightTheme.rawValue) }
                        Button { selectedAppTheme = .darkTheme } label: { ActionButtonView(buttonText: AppTheme.darkTheme.rawValue) }
                        Button { selectedAppTheme = .system } label: { ActionButtonView(buttonText: AppTheme.system.rawValue) }
                    }
                    NavigationLink(destination: UserSubmissionScreen()) {
                        ActionButtonView(buttonText: ProfileScreenConstant.submissionFormButton)
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

