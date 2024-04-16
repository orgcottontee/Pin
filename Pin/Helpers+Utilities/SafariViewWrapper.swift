//
//  SafariViewWrapper.swift
//  JingPin
//
//  Created by adobada on 4/16/24.
//

import SwiftUI
import SafariServices

struct SafariViewWrapper: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) { }
    
}
