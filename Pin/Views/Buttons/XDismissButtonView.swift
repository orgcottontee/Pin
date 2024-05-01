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
                .frame(width: 25, height: 25)
                .foregroundStyle(Color.App.accent)
            Image(systemName: "xmark")
                .applyJPBody(.App.background)
                .imageScale(.small)
                .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    XDismissButtonView()
}
