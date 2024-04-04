//
//  SettingsScreen.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct SettingsScreen: View {
    
    @AppStorage("appTheme") private var selectedAppTheme = Constants.AppTheme.system
    
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
        ZStack {
            Color.brandPrimary
                .ignoresSafeArea()
            HStack {
                Button {
                    selectedAppTheme = .lightTheme
                } label: {
                    ButtonView(buttonText: "Light")
                }
                Button {
                    selectedAppTheme = .darkTheme
                } label: {
                    ButtonView(buttonText: "Dark")
                }
                Button {
                    selectedAppTheme = .system
                } label: {
                    ButtonView(buttonText: "System")
                }
            }
            .padding(.horizontal)
            .preferredColorScheme(selectedTheme)
        }
    }
}

#Preview {
    SettingsScreen()
}
