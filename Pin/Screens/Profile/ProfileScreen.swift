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
                        Button { selectedAppTheme = .lightTheme} label: { ActionButtonView(smallText: AppTheme.lightTheme.rawValue, icon: "rays") }
                        Button { selectedAppTheme = .darkTheme } label: { ActionButtonView(smallText: AppTheme.darkTheme.rawValue, icon: "moon.fill") }
                        Button { selectedAppTheme = .system } label: { ActionButtonView(smallText: AppTheme.system.rawValue, icon: "gear") }
                    }
                    NavigationLink(destination: UserSubmissionScreen().toolbarRole(.editor)) {
                        ActionButtonView(smallText: ProfileScreenConstant.submissionFormButton, icon: "rectangle.and.pencil.and.ellipsis")
                            .accessibilityLabel(Text("Submit a boutique"))
                    }
                    ShareLink(item: URL(string: "https://apps.apple.com/app/id6502470376")!) {
                        HStack {
                            ActionButtonView(smallText: "Share App", icon: "square.and.arrow.up")
                        }
                    }
                    Spacer()
                }
                .preferredColorScheme(selectedTheme)
                .padding()
            }
        }
        .tint(.App.accent)
    }
}

#Preview {
    ProfileScreen()
}

