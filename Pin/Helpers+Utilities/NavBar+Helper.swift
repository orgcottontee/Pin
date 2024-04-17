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
        appearance.backgroundColor = UIColor(Color.appBackground)
        appearance.shadowColor = .clear
        
        let cancelButton = [NSAttributedString.Key.foregroundColor: UIColor.accent]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButton, for: .normal)
        
        UINavigationBar.appearance().tintColor = .accent
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
    }
}
