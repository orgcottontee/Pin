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
        appearance.backgroundColor = UIColor(Color.appPrimary)
        appearance.shadowColor = .clear
        
        let cancelButton = [NSAttributedString.Key.foregroundColor: UIColor.appAccent]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButton, for: .normal)
        
        UINavigationBar.appearance().tintColor = .appAccent
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
    }
}
