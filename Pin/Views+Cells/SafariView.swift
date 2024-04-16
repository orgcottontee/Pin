//
//  SafariView.swift
//  JingPin
//
//  Created by adobada on 4/16/24.
//

import SwiftUI

struct SafariView: View {
    
    @Binding var showSafari: Bool
    var title: String
    var url: String
    
    var body: some View {
        Button {
            showSafari = true
        } label: {
            ActionButtonView(buttonText: title)
        }
            .popover(isPresented: $showSafari) {
                SafariViewWrapper(url: URL(string: url)!)
        }
    }
}

#Preview {
    SafariView(showSafari: .constant(true),
               title: "Testing Safari",
               url: "https://www.apple.com" )
}
