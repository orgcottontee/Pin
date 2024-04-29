//
//  XDismissButtonView.swift
//  JingPin
//
//  Created by adobada on 4/29/24.
//

import SwiftUI

struct XDismissButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color.App.accent)
            Image(systemName: "xmark")
                .foregroundStyle(Color.App.background)
                .imageScale(.small)
                .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    XDismissButtonView()
}
