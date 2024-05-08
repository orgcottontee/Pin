//
//  ActionButtonView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct ActionButtonView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var smallText: String
    var icon: String
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 40)
                .foregroundStyle(Color(.App.accent))
            if dynamicTypeSize >= .accessibility3 {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color(.App.background))
                    .frame(height: 30)
            } else {
                Text(smallText)
                .applyJPBody(.App.background)
            }
        }
        
    }
}

#Preview {
    ActionButtonView(smallText: "Visit shopandson.com", icon: "globe")
}
