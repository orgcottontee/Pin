//
//  NavBar+Helper.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct NavBar {
    
    static func configureAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color.brandPrimary)
        appearance.shadowColor = .clear
        
        let cancelButton = [NSAttributedString.Key.foregroundColor: UIColor.brandAccent]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButton, for: .normal)
        
        UINavigationBar.appearance().tintColor = .brandAccent
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
    }
}
